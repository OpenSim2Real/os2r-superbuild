#pragma once

#include <real_time_tools/spinner.hpp>
#include <real_time_tools/thread.hpp>
#include <real_time_tools/timer.hpp>
#include <time_series/time_series.hpp>

#include <algorithm>
#include <fstream>
#include <math.h>
#include <optional>
#include <tuple>
#include <unordered_map>

#include "monopod_sdk/common_header.hpp"
#include "monopod_sdk/monopod_drivers/leg.hpp"

namespace monopod_drivers {

/**
 * @brief Drivers for open sim2real monopod. Interfaces with the monopod TI
 * motors using monopod_drivers::BlmcJointModule. This class creates a real time
 * control thread which reads and writes from a buffer exposed to the public
 * api.
 */
class Monopod {

public:
  /**
   * @brief Construct a new Monopod object.
   *
   */
  Monopod();

  /**
   * @brief Destroy the Monopod object
   */
  ~Monopod();

  /**
   * @brief Initialize can_bus connections to encoder board and motor board.
   *
   * @param monopod_mode defines the task mode of the monopod. Can also specify
   * individual boards.
   */
  bool initialize(Mode monopod_mode, bool dummy_mode = false);

  /**
   * @brief is the monopod sdk Initialized?.
   */
  bool initialized() const;

  /** @brief Print the motor status and state. */
  void print(const Vector<int> &joint_indexes = {}) const;

  /**
   * @brief This method is a helper to start the thread safety_loop. Requires
   * the class to be initialized before the safety_loop can be started.
   */
  void start_safety_loop();

  /**
   * @brief This method is a helper class to goto some position for the leg.
   * This requires the board to be initialized in any mode which has active
   * motors. Additionally this function will pause the limit checks and will
   * reset the board before executing the position control. This is to allow
   * homing from outside the limits.
   */
  void goto_position(const double &hip_home_position = 0,
                     const double &knee_home_position = 0);

  /**
   * @brief This method is a helper class to hold the position the leg was in
   * when the function was called. This function will only change the state if
   * the motor board is active. otherwise nothing will happen. When holding the
   * monopod wll be a read only state until the holding is killed.
   */
  void hold_position();

  /**
   * @brief Is the monopod holding the current leg position?
   */
  bool is_hold_position();

  /**
   * @brief Stops robot from holding.
   */
  void stop_hold_position();

  /**
   * @brief Calibrate the Encoders.
   *
   * @param hip_home_offset_rad hip offset from found encoder index 0 (rad)
   * @param knee_home_offset_rad knee offset from found encoder index 0
   * (rad)
   */
  void calibrate(const double &hip_home_offset_rad = 0,
                 const double &knee_home_offset_rad = 0);

  /**
   * @brief Get model name
   *
   * @return String of model name
   */
  std::string get_model_name() const;

  /**
   * @brief Get a map of 'active' joint strings indexing their enumerator index
   *
   * @return Unordered map of joint name strings as key and index as value
   */
  std::unordered_map<std::string, int> get_joint_names() const;

  /**
   * @brief check if the joint is a controllable joint (has a motor) or only
   * a observation joint (encoder only).
   *
   * @param joint_index name of the joint we want to access
   * @return bool whether joint is controllable
   */
  bool is_joint_controllable(const int joint_index);

  /**
   * @brief Is the robot in a valid state? HOLDING state and safemode is
   * considered invalid.
   *
   * @return bool, true if valid otherwise false.
   */
  bool valid();

  /**
   * @brief If the joint module is not valid (safemode after limit reached) the
   * joint will be reset into a valid state (The joint must be set
   * back into the valid state first otherwise it will trigger the limits
   * again). Additionally by default the reset function will attempt to control
   * the robot leg to ther zero pose. Regardless of status of the zero pose
   * movement the robot reset will pause the motors to avoid a timeout.
   *
   * @param move_to_zero True if you want the monopod to move into zero
   * position, otherwise false.
   */
  void reset(const bool &move_to_zero = true);

  // ======================================
  // setters
  //=======================================

  /**
   * @brief Set the torque target for some joint index. Return a bool whether
   * successful.
   *
   * @param torque_target is the desired torque target for indexed joint
   * @param joint_index name of the joint we want to access
   * @return bool whether setting the value was successfull
   */
  bool set_torque_target(const double &torque_target, const int joint_index);

  /**
   * @brief Set the torque targets for all joint indexes. Return a bool whether
   * successful.
   *
   * @warning  Note: if it fails the behaviour is undefined. For example if
   * first 3 joints are right but one bad index it will updatethe good ones the
   * fail on the bad one.
   *
   * @param torque_targets vector of desired torque targets for indexed joints
   * @param joint_indexes names of the joints we want to access
   * @return bool whether setting the value was successfull
   */
  bool set_torque_targets(const Vector<double> &torque_targets,
                          const Vector<int> &joint_indexes = {});

  /**
   * Set the PID parameters of the joint.
   *
   * @param pid The desired PID parameters.
   * @return True for success, false otherwise.
   */
  bool set_pid(const int &p, const int &i, const int &d,
               const int &joint_index);

  /**
   * Set the maximum Position of the joint.
   *
   * This limit when reached will kill the robot for safety
   *
   * @param max A double with the maximum position of the joint.
   * @param min A double with the minimum position of the joint.
   * @param joint_index name of the joint we want to access
   * @return True for success, false otherwise.
   */
  bool set_joint_position_limit(const double &max, const double &min,
                                const int &joint_index);

  /**
   * Set the maximum velocity of the joint.
   *
   * This limit when reached will kill the robot for safety
   *
   * @param max A double with the maximum velocity of the joint.
   * @param min A double with the minimum velocity of the joint.
   * @param joint_index name of the joint we want to access
   * @return True for success, false otherwise.
   */
  bool set_joint_velocity_limit(const double &max, const double &min,
                                const int &joint_index);

  /**
   * Set the maximum acceleration of the joint.
   *
   * This limit when reached will kill the robot for safety
   *
   * @param max A double with the maximum acceleration of the joint.
   * @param min A double with the minimum acceleration of the joint.
   * @param joint_index name of the joint we want to access
   * @return True for success, false otherwise.
   */
  bool set_joint_acceleration_limit(const double &max, const double &min,
                                    const int &joint_index);

  /**
   * Set the maximum torque target of the joint.
   *
   * This limit when reached will kill the robot for safety
   *
   * @param max_torque_target A double with the maximum torque of the joint.
   * @param joint_index name of the joint we want to access
   * @return True for success, false otherwise.
   */
  bool set_max_torque_target(const double &max_torque_target,
                             const int &joint_index);

  // ======================================
  // getters
  //=======================================

  /**
   * Get the PID parameters of the joint.
   *
   * If no PID parameters have been set, the default parameters are
   * returned.
   *
   * @return The joint PID parameters.
   */
  std::optional<PID> get_pid(const int &joint_index) const;

  /**
   * Get the position limits of the joint.
   *
   * @return The position limits of the joint.
   */
  std::optional<JointLimit>
  get_joint_position_limit(const int &joint_index) const;

  /**
   * Get the velocity limits of the joint.
   *
   * @return The velocity limits of the joint.
   */
  std::optional<JointLimit>
  get_joint_velocity_limit(const int &joint_index) const;

  /**
   * Get the velocity limits of the joint.
   *
   * @return The velocity limits of the joint.
   */
  std::optional<JointLimit>
  get_joint_acceleration_limit(const int &joint_index) const;

  /**
   * @brief Get the max torque
   *
   * @param joint_index
   * @return std::optional<double> containing the max torque if success
   */
  std::optional<double> get_max_torque_target(const int &joint_index) const;

  /**
   * @brief Get the torque
   *
   * @param joint_index
   * @return std::optional<double> containing the torque if success
   */
  std::optional<double> get_torque_target(const int &joint_index) const;

  /**
   * @brief Get the torques of indexed joints
   *
   * @param joint_index
   * @return std::optional<double> containing the torque if success
   */
  std::optional<Vector<double>>
  get_torque_targets(const Vector<int> &joint_indexes = {}) const;

  /**
   * @brief Get the position of joint
   *
   * @param joint_index name of the joint we want to access
   * @return std::optional<double> containing the position if success
   * value of the position (NULL if not valid)
   */
  std::optional<double> get_position(const int &joint_index) const;

  /**
   * @brief Get the velocity of the joint
   *
   * @param joint_index name of the joint we want to access
   * @return std::optional<double> containing the velocity if success
   */
  std::optional<double> get_velocity(const int &joint_index) const;

  /**
   * @brief Get the acceleration of the joint
   *
   * @param joint_index name of the joint we want to access
   * @return std::optional<double> containing the acceleration if success
   */
  std::optional<double> get_acceleration(const int &joint_index) const;

  /**
   * @brief Get the position of the joint indexes
   *
   * @param joint_indexes names of the joints we want to access
   * @return std::optional<vector<double>> containing vector of positions if
   * success
   */
  std::optional<Vector<double>>
  get_positions(const Vector<int> &joint_indexes = {}) const;

  /**
   * @brief Get the velocity of the joint indexes
   *
   * @param joint_indexes names of the joints we want to access
   * @return std::optional<Vector<double>> containing vector of velocities
   * if success
   */
  std::optional<Vector<double>>
  get_velocities(const Vector<int> &joint_indexes = {}) const;

  /**
   * @brief Get the acceleration of the joint indexes
   *
   * @param joint_indexes names of the joints we want to access
   * @return std::optional<Vector<double>> containing vector of
   * accelerations if success
   */
  std::optional<Vector<double>>
  get_accelerations(const Vector<int> &joint_indexes = {}) const;

private:
  /**
   * @brief Possible monopod states.
   */
  enum class MonopodState {
    //! not initialized.
    NOT_INITIALIZED = 0,
    //! Running, safety loop is started in background
    RUNNING,
    //! Holding static location
    HOLDING,
    //! Read only mode. Can only read position and set values of observation
    //! limits.
    READ_ONLY,
  } current_state_;

  /**
   * @brief this function is just a wrapper around the actual safety_loop
   * function, such that it can be spawned as a posix thread.
   */
  static THREAD_FUNCTION_RETURN_TYPE safety_loop(void *instance_pointer) {
    ((Monopod *)(instance_pointer))->safety_loop();
    return THREAD_FUNCTION_RETURN_VALUE;
  }

  /**
   * @brief this is a simple control safety_loop which runs at a kilohertz.
   *
   * it reads the measurement from the analog sensor, in this case the
   * slider. then it scales it and sends it as the current target to
   * the motor.
   */
  void safety_loop();

  /**
   * @brief Simple helper method to serialized getting of data.
   *
   * Gets indees on joint index enum
   */
  std::optional<Vector<double>>
  getJointDataSerialized(const Monopod *monopod,
                         const Vector<int> &joint_indexes,
                         std::function<double(int)> getJointData) const {
    // Take the joint index in lambda. Return the data you want.
    const Vector<int> &jointSerialization =
        joint_indexes.empty() ? monopod->encoder_joint_indexing : joint_indexes;

    Vector<double> data;
    data.reserve(jointSerialization.size());
    for (auto &joint_index : jointSerialization) {
      if (Contains(encoder_joint_indexing, joint_index)) {
        data.push_back(getJointData(joint_index));
      } else {
        return std::nullopt;
      }
    }
    return data;
  }

  /**
   * @brief Helper to create a EncoderJointModule.
   */
  Ptr<EncoderJointModule> create_encoder_module(JointNamesIndex joint_index) {
    /* Create encoders here */
    auto encoder =
        std::make_shared<monopod_drivers::Encoder>(board_, joint_index);
    /* Encoder joint modules */
    return std::make_shared<EncoderJointModule>(joint_index, encoder, 1.0, 0.0,
                                                true);
  }

  /**
   * @brief Helper to create a MotorJointModule.
   */
  Ptr<MotorJointModule> create_motor_module(JointNamesIndex joint_index) {
    /* create motors here*/
    auto motor = std::make_shared<monopod_drivers::Motor>(board_, joint_index);
    /* motor joint modules */
    return std::make_shared<MotorJointModule>(joint_index, motor, 0.025, 9.0,
                                              0.0, true);
  }

  /**
   * @brief Template helper checking if vector contains an element.
   */
  template <typename T>
  bool Contains(const Vector<T> &Vec, const T &Element) const {
    if (std::find(Vec.begin(), Vec.end(), Element) != Vec.end())
      return true;
    return false;
  }

public:
  /**
   * @brief Joint names indexed same as enumerator
   */
  const std::unordered_map<std::string, int> joint_names = {
      {"hip_joint", hip_joint},
      {"knee_joint", knee_joint},
      {"boom_connector_joint", boom_connector_joint},
      {"planarizer_yaw_joint", planarizer_yaw_joint},
      {"planarizer_pitch_joint", planarizer_pitch_joint}};

private:
  /**
   * @brief The task mode of the monopod. Either predefined or custom.
   */
  Mode monopod_mode_;

  /**
   * @brief boolen defining if sdk is initialized.
   */
  bool is_initialized;

  /**
   * @brief the realt time thread object.
   */
  real_time_tools::RealTimeThread rt_thread_safety_;

  /**
   * @brief controls execution of safety_loop which checks limits of joints.
   */
  bool safety_loop_running;

  /**
   * @brief controls execution of safety_loop which checks limits of joints.
   */
  bool pause_safety_loop;

  /**
   * @brief Determines if the joint is in dummy mode. (no connection to real
   * robot)
   */
  bool dummy_mode_;

  /**
   * @brief Canbus connection.
   */
  Ptr<monopod_drivers::CanBus> can_bus_;

  /**
   * @brief Canbus ControlBoards. This maintains connection with the canbus and
   * holds meassurement and write buffers. This could also be a dummy
   * controlboard.
   */
  Ptr<monopod_drivers::ControlBoardsInterface> board_;

  /**
   * @brief Holds encoder joint modules for each active joint.
   */
  std::unordered_map<int, Ptr<EncoderJointModule>> encoders_;

  /**
   * @brief Read Joint names indexed same as enumerator for encoders. All valid
   * joints should be defined here.
   */
  Vector<int> encoder_joint_indexing;

  /**
   * @brief Holds motor joint modules for each active controllable joint.
   */
  std::unordered_map<int, Ptr<MotorJointModule>> motors_;

  /**
   * @brief Write Joint names indexed same as enumerator for actuators.  All
   * valid controlled joints should be defined here.
   */
  Vector<int> motor_joint_indexing;

  /**
   * @brief robot Leg interface object. This is used for calibration and coupled
   * actions like goto position. I m not sure if this is how we should handle
   * it.
   */
  std::unique_ptr<monopod_drivers::Leg> leg_;

}; // end class Monopod definition

} // namespace monopod_drivers
