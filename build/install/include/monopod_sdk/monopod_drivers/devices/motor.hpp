#pragma once

#include <memory>
#include <string>

#include <real_time_tools/timer.hpp>
#include <time_series/time_series.hpp>

#include "monopod_sdk/common_header.hpp"
#include "monopod_sdk/monopod_drivers/devices/boards.hpp"
#include "monopod_sdk/monopod_drivers/devices/device_interface.hpp"
#include "monopod_sdk/monopod_drivers/devices/encoder.hpp"

namespace monopod_drivers {
/**
 * @brief This class declares an interface to the motor. It allows the user to
 * access the sensors data as well as sending controls. The only control
 * supported for now is the current.
 */
class MotorInterface : public EncoderInterface {
public:
  /**
   * @brief Destroy the MotorInterface object
   */
  virtual ~MotorInterface() {}

  /**
   * @brief Actually send the commands and controls.
   */
  virtual void send_if_input_changed() = 0;

  /**
   * Getters
   */

  /**
   * @brief Get the current target object
   *
   * @return Ptr<const ScalarTimeseries> the list of the current values to
   * be sent.
   */
  virtual Ptr<const ScalarTimeseries> get_current_target() const = 0;

  /**
   * @brief Get the history of the sent current targets.
   *
   * @return Ptr<const ScalarTimeseries>
   */
  virtual Ptr<const ScalarTimeseries> get_sent_current_target() const = 0;

  /**
   * Setters
   */

  /**
   * @brief Set the current target. This function saves the data internally.
   * Please call send_if_input_changed() to actually send the data.
   *
   * @param current_target
   */
  virtual void set_current_target(const double &current_target) = 0;

  /**
   * @brief Set the command. Save internally a command to be apply by the
   * motor board. This function save the command internally. Please call
   * send_if_input_changed() to actually send the data.
   *
   * @param command
   */
  virtual void set_command(const ControlBoardsCommand &command) = 0;
};

/**
 * @brief This class implements the MotorInterface.
 */
class Motor : public MotorInterface, public Encoder {
public:
  /**
   * @brief Construct a new Motor object
   *
   * @param board is the ControlBoards to be used.
   * @param motor_id is the id of the motor on the on-board card
   */
  Motor(Ptr<ControlBoardsInterface> board, JointNamesIndex motor_id);

  /**
   * @brief Destroy the Motor object
   *
   */
  virtual ~Motor() {}

  /**
   * @brief Actually send the command and controls via the network,
   * See MotorInterface for more information.
   */
  virtual void send_if_input_changed() { board_->send_if_input_changed(); }

  /**
   * Getters
   */

  /**
   * @brief Get the measurements.
   *
   * @param index
   * @return Ptr<const ScalarTimeseries> the pointer to the desired
   * measurement history.
   */
  virtual Ptr<const ScalarTimeseries>
  get_measurement(const Measurements &index) const;

  /**
   * @brief Get the status.
   *
   * @param index
   * @return Ptr<const StatusTimeseries> the pointer to the desired
   * status history.
   */
  virtual Ptr<const StatusTimeseries> get_status() const;

  /**
   * @brief Get the current target to be sent.
   *
   * @return Ptr<const ScalarTimeseries> the list of current values to be
   * sent.
   */
  virtual Ptr<const ScalarTimeseries> get_current_target() const;

  /**
   * @brief Get the already sent current target values.
   *
   * @return Ptr<const ScalarTimeseries>
   */
  virtual Ptr<const ScalarTimeseries> get_sent_current_target() const;

  /**
   * Setters
   */

  /**
   * @brief Set the current (Ampere) target. See MotorInterface for more
   * information.
   *
   * @param current_target in Ampere
   */
  virtual void set_current_target(const double &current_target);

  /**
   * @brief Set the command. See MotorInterface for more information.
   *
   * @param command
   */
  virtual void set_command(const ControlBoardsCommand &command) {
    board_->set_command(command);
  }

  /** @brief Print the motor status and state. */
  virtual void print() const;

protected:
  /**
   * @brief The ControlBoards to be used for the communication.
   */
  Ptr<ControlBoardsInterface> board_;

  /**
   * @brief The id of the motor on the ControlBoards.
   */
  JointNamesIndex motor_id_;
};

} // namespace monopod_drivers
