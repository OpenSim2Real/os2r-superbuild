#pragma once

#include <memory>
#include <string>

#include <real_time_tools/thread.hpp>
#include <real_time_tools/timer.hpp>
#include <time_series/time_series.hpp>

#include "monopod_sdk/common_header.hpp"
#include "monopod_sdk/monopod_drivers/devices/can_bus.hpp"
#include "monopod_sdk/monopod_drivers/devices/device_interface.hpp"
#include "monopod_sdk/monopod_drivers/utils/os_interface.hpp"

namespace monopod_drivers {
//==============================================================================
/**
 * @brief This ControlBoardsCommand class is a data structurs that defines a
 * command to the monopod_drivers::ControlBoardsInterface::BoardIndex boards.
 */
class ControlBoardsCommand {
public:
  /**
   * @brief Construct a new ControlBoardsCommand object
   */
  ControlBoardsCommand() {}

  /**
   * @brief Construct a new ControlBoardsCommand object
   *
   * @param id defines the command to apply.
   * @param content defines of the command is enabled or disabled.
   */
  ControlBoardsCommand(uint32_t id, int32_t content) {
    id_ = id;
    content_ = content;
  }

  /**
   * @brief Display on a terminal the status of the message.
   */
  void print() const {
    rt_printf("command id: %d, content: %d\n", id_, content_);
  }

  /**
   * @brief IDs are the different implemented commands that one can send to
   * the ControlBoards.
   */
  enum IDs {
    ENABLE_SYS = 1,
    ENABLE_MTR1 = 2,
    ENABLE_MTR2 = 3,
    ENABLE_VSPRING1 = 4,
    ENABLE_VSPRING2 = 5,
    SEND_CURRENT = 12,
    SEND_POSITION = 13,
    SEND_VELOCITY = 14,
    SEND_ADC6 = 15,
    SEND_ENC_INDEX = 16,
    SEND_ALL = 20,
    SET_CAN_RECV_TIMEOUT = 30,
    ENABLE_POS_ROLLOVER_ERROR = 31,
  };

  /**
   * @brief Is the different command status.
   */
  enum Contents { ENABLE = 1, DISABLE = 0 };

  /**
   * @brief id_ is the command to be modifies on the card.
   */
  uint32_t id_;

  /**
   * @brief content_ is the value of teh command to be sent to the cards.
   */
  int32_t content_;
};

//==============================================================================

/**
 * @brief This class represent a 8 bits message that describe the state
 * (enable/disabled) of the card and the two motors or that of the car and 2
 * encoders.
 */
class BoardStatus {
public:
  /**
   * These are the list of bits of the message.
   */

  /**
   * @brief This encodes the error codes. deault is 0 which is no code
   */
  uint8_t error_code : 3;

  /**
   * @brief Bits 0 enables/disable of the system (motor board).
   */
  uint8_t system_enabled : 1;

  /**
   * @brief Bits 1 enables/disable of the motor 1.
   */
  uint8_t motor1_enabled : 1; // 1

  /**
   * @brief Bits 2 checks if the motor 1 is ready or not.
   */
  uint8_t motor1_ready : 1; // 2

  /**
   * @brief Bits 3 enables/disable of the motor 2.
   */
  uint8_t motor2_enabled : 1; // 3

  /**
   * @brief Bits 4 checks if the motor 2 is ready or not.
   */
  uint8_t motor2_ready : 1; // 4

  /**
   * @brief This is the list of the error codes
   */
  enum ErrorCodes {
    //! \brief No error
    NONE = 0,
    //! \brief Encoder error too high
    ENCODER = 1,
    //! \brief Timeout for receiving current references exceeded
    CAN_RECV_TIMEOUT = 2,
    //! \brief Motor temperature reached critical value
    //! \note This is currently unused as no temperature sensing is done.
    CRIT_TEMP = 3, // currently unused
                   //! \brief Some error in the SpinTAC Position Convert module
    POSCONV = 4,
    //! \brief Position Rollover occured
    POS_ROLLOVER = 5,
    //! \brief Some other error
    OTHER = 7
  };

  /**
   * @brief Simply print the status of the motor board.
   */
  void print() const {
    rt_printf("\tSystem enabled: %d\n", system_enabled);
    rt_printf("\tMotor 1 enabled: %d\n", motor1_enabled);
    rt_printf("\tMotor 1 ready: %d\n", motor1_ready);
    rt_printf("\tMotor 2 enabled: %d\n", motor2_enabled);
    rt_printf("\tMotor 2 ready: %d\n", motor2_ready);
    rt_printf("\tError Code: %d\n", error_code);
  }

  /**
   * @brief Check if the all status are green.
   */
  bool is_ready() const {
    if (system_enabled && motor1_enabled && motor1_ready && motor2_enabled &&
        motor2_ready && !error_code) {
      return true;
    } else {
      return false;
    }
  }

  /**
   * @brief Check if the all status are green.
   */
  uint8_t get_error_code() const { return error_code; }

  //! @brief Get a human-readable description of the error code.
  std::string get_error_description() const {
    std::string error_description;
    switch (error_code) {
    case ErrorCodes::NONE:
      error_description = "No Error";
      break;
    case ErrorCodes::ENCODER:
      error_description = "Encoder Error";
      break;
    case ErrorCodes::CAN_RECV_TIMEOUT:
      error_description = "CAN Receive Timeout";
      break;
    case ErrorCodes::CRIT_TEMP:
      error_description = "Critical Temperature";
      break;
    case ErrorCodes::POSCONV:
      error_description = "Error in SpinTAC Position Convert module";
      break;
    case ErrorCodes::POS_ROLLOVER:
      error_description = "Position Rollover";
      break;
    case ErrorCodes::OTHER:
      error_description = "Other Error";
      break;
    default:
      error_description = "Unknown Error";
      break;
    }
    return error_description;
  }
};

//==============================================================================
/**
 * @brief ControlBoardsInterface declares an API to inacte with a ControlBoards.
 */
class ControlBoardsInterface : public DeviceInterface {
public:
  /**
   * @brief Destroy the ControlBoardsInterface object
   */
  virtual ~ControlBoardsInterface() {}

  /**
   * @brief A useful shortcut
   */
  typedef time_series::TimeSeries<BoardStatus> StatusTimeseries;

  /**
   * @brief A useful shortcut
   */
  typedef time_series::TimeSeries<ControlBoardsCommand> CommandTimeseries;

  /**
   * @brief This is the list of the measurement we can access.
   */
  enum MeasurementIndex {
    /**Current for the hip joint*/
    current_0,
    /**Current for the knee joint*/
    current_1,
    // positions

    /**Position of the hip joint*/
    position_0,
    /**Position of the knee joint*/
    position_1,
    /**Position of the planarizer pitch joint*/
    position_2,
    /**Position of the planarizer yaw joint*/
    position_3,
    /**Position of the boom connector joint*/
    position_4,

    // velocities
    /**Velocity of the hip joint*/
    velocity_0,
    /**Velocity of the knee joint*/
    velocity_1,
    /**Velocity of the planarizer pitch joint*/
    velocity_2,
    /**Velocity of the planarizer yaw joint*/
    velocity_3,
    /**Velocity of the boom connector joint*/
    velocity_4,

    // accelerations
    /**Acceleration of the hip joint*/
    acceleration_0,
    /**Acceleration of the knee joint*/
    acceleration_1,
    /**Acceleration of the planarizer pitch joint*/
    acceleration_2,
    /**Acceleration of the planarizer yaw joint*/
    acceleration_3,
    /**Acceleration of the boom connector joint*/
    acceleration_4,

    // encoder index
    /**encoder index (number of encoder rotations from 0) of the hip joint*/
    encoder_index_0,
    /**encoder index (number of encoder rotations from 0) of the knee joint*/
    encoder_index_1,
    /**encoder index (number of encoder rotations from 0) of the planarizer
       pitch joint*/
    encoder_index_2,
    /**encoder index (number of encoder rotations from 0) of the planarizer yaw
       joint*/
    encoder_index_3,
    /**encoder index (number of encoder rotations from 0) of the boom connector
       joint*/
    encoder_index_4,

    // Misc
    analog_0,
    analog_1,
    measurement_count
  };

  /**
   * @brief This is the list of the measurement we can access.
   */
  enum BoardIndex {
    /**Motor board is the board with the motors for the planarizer leg. This
       board must e flashed with the proper firmware.*/
    motor_board,
    /**Encoder board 1 is the board with the planarizer yaw and pitch joints
       encoders. Index 0 will be pitch and index 1 is yaw.*/
    encoder_board1,
    /**Encoder board 2 is the board with the boom connector joint. Index 0 is
       where encoder should be located*/
    encoder_board2,
    /**this shows the number of boards when converteed to an int.*/
    board_count
  };

  /**
   * @brief This is the list of the controls we can send
   */
  enum ControlIndex {
    /**Current for the hip joint*/
    current_target_0,
    /**Current for the knee joint*/
    current_target_1,
    /**This shows the number of current targets when converteed to an int.*/
    control_count
  };

  /**
   * Getters
   */

  /**
   * @brief Get the measurements
   *
   * @param index is the kind of measurement we are looking for.
   * @return Ptr<const ScalarTimeseries>  is the list of the last time stamped
   * measurement acquiered.
   */
  virtual Ptr<const ScalarTimeseries>
  get_measurement(const int &index) const = 0;

  /**
   * @brief Get the status of one of the boards.
   *
   * @param index the kind of status we are interested in.
   * @return Ptr<const StatusTimeseries> is the list of the last status of
   * the card.
   */
  virtual Ptr<const StatusTimeseries> get_status(const int &index) const = 0;

  /**
   * input logs
   */

  /**
   * @brief Get the controls to be send.
   *
   * @param index define the kind of control we are looking for.
   * @return Ptr<const ScalarTimeseries> is the list of the controls to be
   * send.
   */
  virtual Ptr<const ScalarTimeseries> get_control(const int &index) const = 0;

  /**
   * @brief Get the commands to be send.
   *
   * @return Ptr<const CommandTimeseries> is the list of the commands to be
   * send.
   */
  virtual Ptr<const CommandTimeseries> get_command() const = 0;

  /**
   * @brief Get the sent controls.
   *
   * @param index define the kind of control we are looking for.
   * @return Ptr<const ScalarTimeseries> is the list of the controls sent
   * recently.
   */
  virtual Ptr<const ScalarTimeseries>
  get_sent_control(const int &index) const = 0;

  /**
   * @brief Get the sent commands.
   *
   * @return Ptr<const CommandTimeseries>  is the list of the commands sent
   * recently.
   */
  virtual Ptr<const CommandTimeseries> get_sent_command() const = 0;

  /**
   * Setters
   */

  /**
   * @brief Set a board to an active state if it is not already active. This
   * means the board will now have its status checked for is_ready and if the
   * board is the motor_board we must send enable the motors etc.
   *
   * @param index
   */
  virtual void set_active_board(const int &index) = 0;

  /**
   * @brief set_control save the control internally. In order to actaully send
   * the controls to the network please call "send_if_input_changed"
   *
   * @param control is the value of the control.
   * @param index define the kind of control we want to send.
   */
  virtual void set_control(const double &control, const int &index) = 0;

  /**
   * @brief set_command save the command internally. In order to actaully send
   * the controls to the network please call "send_if_input_changed"
   *
   * @param command is the command to be sent.
   */
  virtual void set_command(const ControlBoardsCommand &command) = 0;

  /**
   * @brief Actually send the commands and the controls
   */
  virtual void send_if_input_changed() = 0;

  /**
   * @brief returns only once board and motors are ready.
   */
  virtual void wait_until_ready() = 0;

  /**
   * This will cause the control to be forced into a "safemode" where the
   * control is set to zero then held constant until reset.
   */
  virtual void enter_safemode() = 0;

  /**
   * This will return if the control is in "safemode".
   */
  virtual bool is_safemode() = 0;

  /**
   * This will cause the control to reset the "safemode" if the control is
   * currently in safemode. Additionally the motors will be paused and The
   * control boards will be reset such that any timed out connection will be
   * reestablished.
   */
  virtual void reset() = 0;
};

/**
 * @brief Create a vector of pointers.
 *
 * @tparam Type of the data
 * @param size is number of pointers to be created.
 * @param length is the dimension of the data arrays.
 * @return Vector<Ptr<Type>> which is the a list of list of data of type
 * Type
 */
template <typename Type>
std::vector<std::shared_ptr<Type>>
create_vector_of_pointers(const size_t &size, const size_t &length) {
  std::vector<std::shared_ptr<Type>> vector;
  vector.resize(size);
  for (size_t i = 0; i < size; i++) {
    vector[i] = std::make_shared<Type>(length, 0, false);
  }
  return vector;
}

//==============================================================================
/**
 * @brief This class CanBusControlBoards implements a ControlBoardsInterface
 * specific to CAN networks.
 */
class CanBusControlBoards : public ControlBoardsInterface {
public:
  /**
   * @brief Construct a new CanBusControlBoards object
   *
   * @param can_bus
   * @param history_length
   */
  CanBusControlBoards(std::shared_ptr<CanBusInterface> can_bus,
                      const size_t &history_length = 1000,
                      const int &control_timeout_ms = 100);

  /**
   * @brief Destroy the CanBusControlBoards object
   */
  ~CanBusControlBoards();

  /**
   * Getters
   */

  /**
   * @brief Get the measurement data.
   *
   * @param index is the kind of measurement we are insterested in.
   * @return Ptr<const ScalarTimeseries> is the list of the last measurements
   * acquiered from the CAN card.
   */
  virtual Ptr<const ScalarTimeseries> get_measurement(const int &index) const {
    return measurement_[index];
  }

  /**
   * @brief Get the status of the CAN card.
   *
   * @param index the kind of status we are interested in.
   * @return Ptr<const StatusTimeseries> is the list of last acquiered status.
   */
  virtual Ptr<const StatusTimeseries> get_status(const int &index) const {
    return status_[index];
  }

  /**
   * @brief Get the controls to be sent.
   *
   * @param index the kind of control we are interested in.
   * @return Ptr<const ScalarTimeseries> is the list of the control to be
   * sent.
   */
  virtual Ptr<const ScalarTimeseries> get_control(const int &index) const {
    return control_[index];
  }

  /**
   * @brief Get the commands to be sent.
   *
   * @return Ptr<const CommandTimeseries> is the list of the command to be
   * sent.
   */
  virtual Ptr<const CommandTimeseries> get_command() const { return command_; }

  /**
   * @brief Get the already sent controls.
   *
   * @param index the kind of control we are interested in.
   * @return Ptr<const ScalarTimeseries> is the list of the sent cotnrols.
   */
  virtual Ptr<const ScalarTimeseries> get_sent_control(const int &index) const {
    return control_[index];
  }

  /**
   * @brief Get the already sent commands.
   *
   * @return Ptr<const CommandTimeseries> is the list of the sent cotnrols.
   */
  virtual Ptr<const CommandTimeseries> get_sent_command() const {
    return sent_command_;
  }

  /**
   * Setters
   */

  /**
   * @brief Set a board to an active state if it is not already active. This
   * means the board will now have its status checked for is_ready and if the
   * board is the motor_board we must send enable the motors etc.
   *
   * @param index
   */
  virtual void set_active_board(const int &index);

  /**
   * @brief Set the controls, see ControlBoardsInterface::set_control
   *
   * @param control
   * @param index
   */
  virtual void set_control(const double &control, const int &index) {
    control_[index]->append(control);
  }

  /**
   * @brief Set the commands, see ControlBoardsInterface::set_command
   *
   * @param command
   */
  virtual void set_command(const ControlBoardsCommand &command) {
    command_->append(command);
  }

  /**
   * @brief Send the actual command and controls.
   */
  virtual void send_if_input_changed();

  /**
   * @brief returns only once board and motors are ready.
   */
  virtual void wait_until_ready();

  /**
   * This will cause the control to reset the "safemode" if the control is
   * currently in safemode. Additionally the motors will be paused and The
   * control boards will be reset such that any timed out connection will be
   * reestablished.
   */
  virtual void reset();

  /**
   * This will cause the control to be forced into a "safemode" where the
   * control is set to zero then held constant until reset.
   */
  virtual void enter_safemode() {
    // Ensure we are not in safe mode for the pause motors to be able to send
    // control.
    is_safemode_ = false;
    pause_motors();
    is_safemode_ = true;
  }

  /**
   * This will return if the control is in "safemode".
   */
  virtual bool is_safemode() { return is_safemode_; }

  /**
   * @brief True if all active boards have established at least one status
   * message from the board that does not include any error.
   */
  bool is_ready();

  /**
   * @brief Sets motors to Idle and sets the canbus control recieve timeout on
   * board to none until next action is sent.
   */
  void pause_motors();

  /**
   * @brief Disable the can reciever timeout.
   */
  void disable_can_recv_timeout();

  /// private methods ========================================================
private:
  /**
   * Useful converters
   */

  /**
   * @brief Converts from bytes to int32.
   *
   * @tparam T this is the type of the bytes convert.
   * @param bytes The bytes value
   * @return int32_t the output integer in int32.
   */
  template <typename T> int32_t bytes_to_int32(T bytes) {
    return (int32_t)bytes[3] + ((int32_t)bytes[2] << 8) +
           ((int32_t)bytes[1] << 16) + ((int32_t)bytes[0] << 24);
  }

  /**
   * @brief Convert from 24-bit normalized fixed-point to float.
   *
   * @param qval is the floating base point.
   * @return float is the converted value
   */
  float q24_to_float(int32_t qval) { return ((float)qval / (1 << 24)); }

  /**
   * @brief Converts from float to 24-bit normalized fixed-point.
   *
   * @param fval
   * @return int32_t
   */
  int32_t float_to_q24(float fval) { return ((int)(fval * (1 << 24))); }

  /**
   * @brief Converts from qbytes to float
   *
   * @tparam T the type of byte to manage
   * @param qbytes the input value in bytes
   * @return float the output value.
   */
  template <typename T> float qbytes_to_float(T qbytes) {
    return q24_to_float(bytes_to_int32(qbytes));
  }

  /**
   * @brief send the controls to the cards.
   *
   * @param controls are the controls to be sent.
   */
  void send_newest_controls();

  /**
   * @brief send the latest commands to the cards.
   *
   */
  void send_newest_command();

  /**
   * @brief This is the helper function used for spawning the real time
   * thread.
   *
   * @param instance_pointer is the current object in this case.
   * @return THREAD_FUNCTION_RETURN_TYPE depends on the current OS.
   */
  static THREAD_FUNCTION_RETURN_TYPE loop(void *instance_pointer) {
    ((CanBusControlBoards *)(instance_pointer))->loop();
    return THREAD_FUNCTION_RETURN_VALUE;
  }

  /**
   * @brief Is the loop that constently communicate with the network.
   */
  void loop();

  /**
   * @brief Display details of this object.
   */
  void print_status();

private:
  /**
   * @brief This is the pointer to the can bus to communicate with.
   */
  std::shared_ptr<CanBusInterface> can_bus_;

  /**
   * @brief These are the frame IDs that define the kind of data we acquiere
   * from the CAN bus
   */
  enum CanframeIDs {
    COMMAND_ID = 0x00,
    IqRef = 0x05,
    // Status messages
    BOARD1_STATUSMSG = 0x10,
    BOARD2_STATUSMSG = 0x11,
    BOARD3_STATUSMSG = 0x12,
    Iq = 0x20,
    // positions
    BOARD1_POS = 0x30,
    BOARD2_POS = 0x31,
    BOARD3_POS = 0x32,
    // velocities
    BOARD1_VEL = 0x40,
    BOARD2_VEL = 0x41,
    BOARD3_VEL = 0x42,
    // misc
    ADC6 = 0x50,
    // encoder indexes
    BOARD1_ENC_INDEX = 0x60,
    BOARD2_ENC_INDEX = 0x61,
    BOARD3_ENC_INDEX = 0x62,
    // accelerations
    BOARD1_ACC = 0x70,
    BOARD2_ACC = 0x71,
    BOARD3_ACC = 0x72,
  };
  /**
   * State Info
   */
  Vector<int> active_boards_;

  /**
   * Outputs
   */

  /**
   * @brief measurement_ contains all the measurements acquiered from the CAN
   * board.
   */
  Vector<Ptr<ScalarTimeseries>> measurement_;

  /**
   * @brief This is the status history of the CAN board.
   */
  Vector<Ptr<StatusTimeseries>> status_;

  /**
   * Inputs
   */

  /**
   * @brief This is the buffer of the controls to be sent to card.
   */
  Vector<Ptr<ScalarTimeseries>> control_;

  /**
   * @brief This is the buffer of the commands to be sent to the card.
   */
  Ptr<CommandTimeseries> command_;

  /**
   * Log
   */

  /**
   * @brief This is the history of the already sent controls.
   */
  Vector<Ptr<ScalarTimeseries>> sent_control_;

  /**
   * @brief This is the history of the already sent commands.
   */
  Ptr<CommandTimeseries> sent_command_;

  /**
   * Loop management
   */

  /**
   * @brief This boolean makes sure that the loop is stopped upon destruction
   * of this object.
   */
  bool is_loop_active_;

  /**
   * @brief This variables if true means two things: Are motor in idle mode = 0
   * torques?, and is the timeout duration for a control signal zero on the TI
   * board? When a new control is sent the motors will enter into their normal
   * state where they are active with the proper timeout duration.
   */
  bool motors_are_paused_;

  /**
   * @brief Is the system in safemode? This implies the motors were killed and
   * now being held constant at 0 control magnitude. This is maintained until
   * reset.
   */
  bool is_safemode_;

  /**
   * @brief If no control is sent for more than control_timeout_ms_ the board
   * will shut down
   */
  int control_timeout_ms_;

  /**
   * @brief This is the thread object that allow to spwan a real-time thread
   * or not dependening on the current OS.
   */
  real_time_tools::RealTimeThread rt_thread_;
};

//==============================================================================
/**
 * @brief This class DummyControlBoards implements a ControlBoardsInterface
 * specific to CAN networks.
 */
class DummyControlBoards : public ControlBoardsInterface {
public:
  /**
   * @brief Construct a new DummyControlBoards object
   *
   */
  DummyControlBoards() {
    int history_length = 1000;

    measurement_ = create_vector_of_pointers<ScalarTimeseries>(
        measurement_count, history_length);

    status_ = create_vector_of_pointers<StatusTimeseries>(board_count,
                                                          history_length);

    control_ = create_vector_of_pointers<ScalarTimeseries>(control_count,
                                                           history_length);

    sent_control_ = create_vector_of_pointers<ScalarTimeseries>(control_count,
                                                                history_length);

    BoardStatus status;
    status.system_enabled = 1;
    status.motor1_enabled = 1;
    status.motor1_ready = 1;
    status.motor2_enabled = 1;
    status.motor2_ready = 1;
    status.error_code = 0;

    status_[encoder_board1]->append(status);
    status_[encoder_board2]->append(status);
    status_[motor_board]->append(status);

    // Meassurements
    measurement_[current_0]->append(0);
    measurement_[current_1]->append(0);
    measurement_[position_0]->append(0);
    measurement_[position_1]->append(0);
    measurement_[position_2]->append(0);
    measurement_[position_3]->append(0);
    measurement_[position_4]->append(0);
    measurement_[velocity_0]->append(0);
    measurement_[velocity_1]->append(0);
    measurement_[velocity_2]->append(0);
    measurement_[velocity_3]->append(0);
    measurement_[velocity_4]->append(0);
    measurement_[acceleration_0]->append(0);
    measurement_[acceleration_1]->append(0);
    measurement_[acceleration_2]->append(0);
    measurement_[acceleration_3]->append(0);
    measurement_[acceleration_4]->append(0);
    measurement_[analog_0]->append(0);
    measurement_[analog_1]->append(0);
    measurement_[encoder_index_0]->append(0);
    measurement_[encoder_index_1]->append(0);

    sent_control_[current_target_0]->append(0);
    sent_control_[current_target_1]->append(0);

    control_[current_target_0]->append(0);
    control_[current_target_1]->append(0);
  }

  /**
   * @brief Destroy the DummyControlBoards object
   */
  ~DummyControlBoards(){};

  /**
   * Getters
   */

  /**
   * @brief Get the measurement data.
   *
   * @param index is the kind of measurement we are insterested in.
   * @return Ptr<const ScalarTimeseries> is the list of the last measurements
   * acquiered from the CAN card.
   */
  virtual Ptr<const ScalarTimeseries> get_measurement(const int &index) const {
    return measurement_[index];
  }

  /**
   * @brief Get the status of the CAN card.
   *
   * @param index the kind of status we are interested in.
   * @return Ptr<const StatusTimeseries> is the list of last acquiered status.
   */
  virtual Ptr<const StatusTimeseries> get_status(const int &index) const {
    return status_[index];
  }

  /**
   * @brief Get the controls to be sent.
   *
   * @param index the kind of control we are interested in.
   * @return Ptr<const ScalarTimeseries> is the list of the control to be
   * sent.
   */
  virtual Ptr<const ScalarTimeseries> get_control(const int &index) const {
    return control_[index];
  }

  /**
   * @brief Get the commands to be sent.
   *
   * @return Ptr<const CommandTimeseries> is the list of the command to be
   * sent.
   */
  virtual Ptr<const CommandTimeseries> get_command() const {
    rt_printf("get_sent_command not implemented in dummy board class.");
    exit(-1);
  }

  /**
   * @brief Get the already sent controls.
   *
   * @param index the kind of control we are interested in.
   * @return Ptr<const ScalarTimeseries> is the list of the sent cotnrols.
   */
  virtual Ptr<const ScalarTimeseries> get_sent_control(const int &index) const {
    return control_[index];
  }

  /**
   * @brief Get the already sent commands.
   *
   * @return Ptr<const CommandTimeseries> is the list of the sent cotnrols.
   */
  virtual Ptr<const CommandTimeseries> get_sent_command() const {
    rt_printf("get_sent_command not implemented in dummy board class.");
    exit(-1);
  }

  /**
   * Setters
   */

  /**
   * @brief Set a board to an active state if it is not already active. This
   * means the board will now have its status checked for is_ready and if the
   * board is the motor_board we must send enable the motors etc.
   *
   * @param index
   */
  virtual void set_active_board(const int &index) {
    rt_printf("set board index '%d' id to active\n", index);
  }

  /**
   * @brief Set the controls, see ControlBoardsInterface::set_control
   *
   * @param control
   * @param index
   */
  virtual void set_control(const double &control, const int &index) {
    control_[index]->append(control);
  }

  /**
   * @brief Set the commands, see ControlBoardsInterface::set_command
   *
   * @param command
   */
  virtual void set_command(const ControlBoardsCommand &command) {
    rt_printf("set command id: %d\n", command.id_);
  }

  /**
   * @brief Send the actual command and controls.
   */
  virtual void send_if_input_changed() {
    for (size_t i = 0; i < control_.size(); i++) {
      if (control_[i]->length() == 0) {
        rt_printf("you tried to send control but no control has been set\n");
        exit(-1);
      }

      Index timeindex = control_[i]->newest_timeindex();
      sent_control_[i]->append((*control_[i])[timeindex]);
    }
  }

  /**
   * @brief returns only once board and motors are ready.
   */
  virtual void wait_until_ready(){};

  /**
   * This will cause the control to reset the "safemode" if the control is
   * currently in safemode. Additionally the system will be set to idle with no
   * timeout on communication.
   */
  virtual void reset() { is_safemode_ = false; };

  /**
   * This will cause the control to be forced into a "safemode" where the
   * control is set to zero then held constant until reset.
   */
  virtual void enter_safemode() { is_safemode_ = true; };

  /**
   * This will return if the control is in "safemode".
   */
  virtual bool is_safemode() { return is_safemode_; };

  /**
   * @brief measurement_ contains all the measurements acquiered from the CAN
   * board.
   */
  Vector<Ptr<ScalarTimeseries>> measurement_;

  /**
   * @brief This is the status history of the CAN board.
   */
  Vector<Ptr<StatusTimeseries>> status_;

  /**
   * @brief This is the buffer of the controls to be sent to card.
   */
  Vector<Ptr<ScalarTimeseries>> control_;

  /**
   * @brief This is the history of the already sent controls.
   */
  Vector<Ptr<ScalarTimeseries>> sent_control_;

  /**
   * @brief Is the system in safemode? This implies the motors were killed and
   * now being held constant at 0 control magnitude. This is maintained until
   * reset.
   */
  bool is_safemode_ = false;
};

} // namespace monopod_drivers
