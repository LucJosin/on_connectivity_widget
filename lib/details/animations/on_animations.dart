part of on_connectivity_widget;

/// Message animation from Bottom of application.
///
/// Note: If you are using BottomNagivationBar, the message will appear above it.
Animation<Offset> onBottomAnim(
    AnimationController _controller, Curve? _animation) {
  return Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _controller, curve: _animation ?? Curves.linearToEaseOut));
}

/// Message animation from Top of application.
///
/// Note: If you are using AppBar, the message will appear below it.
Animation<Offset> onTopAnim(
    AnimationController _controller, Curve? _animation) {
  return Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _controller, curve: _animation ?? Curves.linearToEaseOut));
}

/// Message animation from Left Top_or_Bottom of application.
Animation<Offset> onTopAndBottomLeftAnim(
    AnimationController _controller, Curve? _animation) {
  return Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _controller, curve: _animation ?? Curves.linearToEaseOut));
}

/// Message animation from Right Top_or_Bottom of application.
Animation<Offset> onTopAndBottomRightAnim(
    AnimationController _controller, Curve? _animation) {
  return Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _controller, curve: _animation ?? Curves.linearToEaseOut));
}

//
// Animation<Offset> onCustomAnim(AnimationController _controller,
//     Curve? _animation, Offset _begin, Offset _end) {
//   return Tween<Offset>(begin: _begin, end: _end).animate(CurvedAnimation(
//       parent: _controller, curve: _animation ?? Curves.linearToEaseOut));
// }
