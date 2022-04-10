#pragma once
#include "monopod_sdk/mode.hpp"
#include <time_series/time_series.hpp>

namespace monopod_drivers {

/**
 * ================================================
 * Definitions of constants for robot
 * ================================================
 */

/**
 * Max current before the robot gets kill in amps (A).
 */
#define MAX_CURRENT 12.0

// #define VERBOSE true

/**
 * Number of joints in a monopod_drivers::Leg.
 */
#define NUMBER_LEG_JOINTS 2

/**
 * ================================================
 * Type defs
 * ================================================
 */

/**
 * @brief A useful shortcut
 */
typedef time_series::TimeSeries<double> ScalarTimeseries;
/**
 * @brief A useful shortcut
 */
typedef time_series::Index Index;
/**
 * @brief A useful shortcut
 */
typedef time_series::TimeSeries<Index> IndexTimeseries;

/**
 * @brief This is a shortcut for creating shared pointer in a simpler
 * writing expression.
 *
 * @tparam Type is the template parameter of the shared pointer.
 */
template <typename Type> using Ptr = std::shared_ptr<Type>;

/**
 * @brief A useful shortcut
 */
template <typename Type> using Vector = std::vector<Type>;

// ====================================================================================

/**
 * @brief Enumerates the joint names for indexing
 */
enum JointNamesIndex {
  hip_joint,
  knee_joint,
  boom_connector_joint,
  planarizer_yaw_joint,
  planarizer_pitch_joint
};

/**
 * @brief Here is a list of the different measurement available on the
 * blmc card.
 */
enum Measurements {
  position,
  velocity,
  acceleration,
  current,
  encoder_index,
  measurement_count, // Meassurement count is the 'length' of the meassurement
                     // vector in motor board.
};

/**
 * @brief Structure holding the PID values for the joint.
 */
struct PID {
  PID() = default;
  PID(const double _p, const double _i, const double _d)
      : p(_p), i(_i), d(_d) {}

  double p = 0;
  double i = 0;
  double d = 0;
};
/**
 * @brief Structure holding joint limits
 */
struct JointLimit {
  static constexpr double m = std::numeric_limits<double>::lowest();
  static constexpr double M = std::numeric_limits<double>::max();

  JointLimit() {
    min = m;
    max = M;
  }

  JointLimit(const double _min, const double _max) : min(_min), max(_max) {}

  double min;
  double max;
};

} // end namespace monopod_drivers
