part of on_connectivity_widget;

/// Define message position in application.
///
/// Types:
///
/// * [TOP]
/// * [BOTTOM]
/// * [LEFT_TOP]
/// * [LEFT_BOTTOM]
/// * [RIGHT_TOP]
/// * [RIGHT_BOTTOM]
///
enum PositionType {
  /// Top of application.
  ///
  /// Note: If you are using AppBar, the message will appear below it.
  TOP,

  /// Bottom of application.
  ///
  /// Note: If you are using BottomNagivationBar, the message will appear above it.
  BOTTOM,

  /// Left_Top of application.
  LEFT_TOP,

  /// Left_Bottom of application.
  LEFT_BOTTOM,

  /// Right_Top of application.
  RIGHT_TOP,

  /// Right_Bottom of application.
  RIGHT_BOTTOM,
}
