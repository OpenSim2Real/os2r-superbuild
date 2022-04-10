#pragma once

#include <array>
#include <iostream>
#include <math.h>
#include <stdexcept>

#include <Eigen/Eigen>

#include "monopod_sdk/common_header.hpp"
#include "monopod_sdk/monopod_drivers/devices/motor.hpp"
#include "monopod_sdk/monopod_drivers/encoder_joint_module.hpp"
#include "monopod_sdk/monopod_drivers/utils/polynome.hpp"

namespace monopod_drivers {

// TODO what is the best scope for those homing-related types?

/**
 * @brief Possible return values of the homing
 */
enum class HomingReturnCode {
  //! Homing was not initialized and can therefore not be performed.
  NOT_INITIALIZED = 0,
  //! Homing is currently running.
  RUNNING,
  //! Homing is succeeded.
  SUCCEEDED,
  //! Homing failed.
  FAILED
};

/**
 * @brief Possible return values of the go_to
 */
enum class GoToReturnCode {
  //! GoTo is currently running.
  RUNNING,
  //! Position has been reached succeeded.
  SUCCEEDED,
  //! Robot is stuck(hit an obstacle) before reaching its final position.
  FAILED
};

/**
 * @brief State variables required for the homing.
 */
struct HomingState {
  //! Id of the joint.  Just used for debug prints.
  int joint_id = 0;
  //! Max. distance to move while searching the encoder index.
  double search_distance_limit_rad = 0.0;
  //! Offset from home position to zero position.
  double home_offset_rad = 0.0;
  //! Step size for the position profile.
  double profile_step_size_rad = 0.0;
  //! Timestamp from when the encoder index was seen the last time.
  long int last_encoder_index_time_index = 0;
  //! Number of profile steps already taken.
  uint32_t step_count = 0;
  //! Current target position of the position profile.
  double target_position_rad = 0.0;
  //! Current status of the homing procedure.
  HomingReturnCode status = HomingReturnCode::NOT_INITIALIZED;

  //! Position at which homing is started
  double start_position;
  /**
   * @brief Position at which homing is ended (before resetting position).
   *
   * This is only set when status is SUCCEEDED.  Together with start_position
   * it can be used to determine the distance the joint travelled during the
   * homing procedure (e.g. useful for home offset calibration).
   */
  double end_position;
};

/**
 * @brief The MotorJointModule class is containing the joint information. It is
 * here to help converting the data from the motor side to the joint side. It
 * also allows the calibration of the joint position during initialization.
 */
class MotorJointModule : public EncoderJointModule {
public:
  /**
   * @brief Construct a new MotorJointModule object
   *
   * @param motor is the C++ object allowing us to send commands and receive
   * sensor data.
   * @param motor_constant (\f$ k \f$) is the torque constant of the motor
   * \f$ \tau_{motor} = k * i_{motor} \f$
   * @param gear_ratio is the gear ratio between the motor and the joint.
   * @param zero_angle is the angle between the closest positive motor index
   * and the zero configuration.
   * @param reverse_polarity
   * @param max_current
   */
  MotorJointModule(JointNamesIndex joint_id,
                   std::shared_ptr<monopod_drivers::MotorInterface> motor,
                   const double &motor_constant, const double &gear_ratio,
                   const double &zero_angle,
                   const bool &reverse_polarity = false);

  /**
   * @brief Set the joint torque to be sent.
   *
   * @param desired_torque (Nm)
   */
  virtual void set_torque(const double &desired_torque);

  /**
   * @brief send the joint torque to the motor. The conversion between joint
   * torque and motor current is done automatically.
   */
  virtual void send_torque();

  /**
   * @brief Set the maximum admissible joint torque that can be applied.
   *
   * @return double
   */
  virtual void set_max_torque(const double &max_torque);

  /**
   * @brief Get the maximum admissible joint torque that can be applied.
   *
   * @return double
   */
  virtual double get_max_torque() const;

  /**
   * @brief Get the sent joint torque.
   *
   * @return double (Nm).
   */
  virtual double get_sent_torque() const;

  /**
   * @brief Get the measured joint torque.
   *
   * @return double (Nm).
   */
  virtual double get_measured_torque() const;

  /**
   * @brief Set control gains for PD position controller.
   *
   * @param kp P gain ( (Nm) / rad ).
   * @param kd D gain ( (Nm) / (rad/s) ).
   */
  void set_position_control_gains(double kp, double kd);

  /**
   * @brief Execute one iteration of the position controller.
   *
   * @param target_position_rad  Target position (rad).
   *
   * @return Torque command (Nm).
   */
  double execute_position_controller(double target_position_rad) const;

  /**
   * @brief Set zero position relative to current position
   *
   * @param home_offset_rad  Offset from home position to zero position.
   *     Unit: radian.
   */
  void homing_at_current_position(double home_offset_rad);

  /**
   * @brief Initialize the homing procedure.
   *
   * This has to be called before update_homing().
   *
   * @param search_distance_limit_rad  Maximum distance the motor moves while
   *     searching for the encoder index.  Unit: radian.
   * @param home_offset_rad  Offset from home position to zero position.
   *     Unit: radian.
   * @param profile_step_size_rad  Distance by which the target position of
   * the position profile is changed in each step.  Set to a negative value to
   *     search for the next encoder index in negative direction.  Unit:
   *     radian.
   */
  void init_homing(double search_distance_limit_rad, double home_offset_rad,
                   double profile_step_size_rad = 0.001);

  /**
   * @brief Perform one step of homing on encoder index.
   *
   * Searches for the next encoder index in positive direction and, when
   * found, sets it as home position.
   *
   * Only performs one step, so this method needs to be called in a loop. This
   * method only set the control, one *MUST* send the control for the motor
   * after calling this method.
   *
   * The motor is moved with a position profile until either the encoder index
   * is reached or the search distance limit is exceeded.  The position is
   * controlled with a simple PD controller.
   *
   * If the encoder index is found, its position is used as home position.
   * The zero position is offset from the home position by adding the "home
   * offset" to it (i.e. zero = home pos. + home offset).
   * If the search distance limit is reached before the encoder index occurs,
   * the homing fails.
   *
   * @return Status of the homing procedure.
   */
  HomingReturnCode update_homing();

  /**
   * @brief Get distance between start and end position of homing.
   *
   * Compute the distance that the joint moved between initialization of
   * homing and reaching the home position.
   *
   * This can be used to determine the home offset by first moving the joint
   * to the desired zero position, then executing the homing and finally
   * calling this function which will provide the desired home offset.
   *
   * @return Distance between start and end position of homing.
   */
  double get_distance_travelled_during_homing() const;

protected:
  /**
   * @brief Convert from joint torque to motor current.
   *
   * @param[in] torque is the input joint
   * @return double the equivalent motor current.
   */
  double joint_torque_to_motor_current(double torque) const;

  /**
   * @brief Convert from motor current to joint torque.
   *
   * @param current is the motor current.
   * @return double is the equivalent joint torque.
   */
  double motor_current_to_joint_torque(double current) const;

  // /**
  //  * @brief Get motor measurements and check if there are data or not.
  //  *
  //  * @param measurement_id is the id of the measurement you want to get.
  //  * check: monopod_drivers::Measurements
  //  * @return double the measurement.
  //  */
  // double get_joint_measurement(const Measurements &measurement_id) const;
  //
  // /**
  //  * @brief Get the last motor measurement index for a specific data. If
  //  there
  //  * was no data yet, return NaN
  //  *
  //  * @param measurement_id is the id of the measurement you want to get.
  //  * check: monopod_drivers::Measurements
  //  * @return double the measurement.
  //  */
  // long int
  // get_joint_measurement_index(const Measurements &measurement_id) const;

  /**
   * @brief This is the pointer to the motor interface.
   */
  std::shared_ptr<monopod_drivers::MotorInterface> motor_;

  /**
   * @brief This is the torque constant of the motor:
   * \f$ \tau_{motor} = k * i_{motor} \f$
   */
  double motor_constant_;

  /**
   * @brief This is the maximum current we can apply during one experiment.
   * The program will clip the current if it goes above this value.
   */
  double max_current_ = MAX_CURRENT * 0.9;

  /**
   * @brief P gain of the position PD controller.
   */
  double position_control_gain_p_;

  /**
   * @brief D gain of the position PD controller.
   */
  double position_control_gain_d_;

  /**
   * @brief Holds the state of homing during the homing sequence.
   */
  struct HomingState homing_state_;
};

} // namespace monopod_drivers
