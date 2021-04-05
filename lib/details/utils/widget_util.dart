part of on_connectivity_widget;

/// Choose what widget will be shown based in network state.
Widget getWidgetBasedInResult(ConnectivityResult _connectivityResult,
    Widget? wifiWidget, Widget? mobileWidget, Widget? noneWidget) {
  switch (_connectivityResult.index) {
    case 0:
      return wifiWidget ?? OnWifiWidget();
    case 1:
      return mobileWidget ?? OnMobileWidget();
    case 2:
      return noneWidget ?? OnNoneWidget();
    default:
      throw FlutterError("CoonnectivityResult returned nonexistent value\n"
          "Report this issue on [on_connectivity_widget] Github.");
  }
}

/// Choose what position will be shown.
Alignment getAlignment(PositionType position) {
  switch (position.index) {
    case 0:
      return Alignment.topCenter;
    case 1:
      return Alignment.bottomCenter;
    case 2:
      return Alignment.topLeft;
    case 3:
      return Alignment.bottomLeft;
    case 4:
      return Alignment.topRight;
    case 5:
      return Alignment.bottomRight;
    default:
      throw FlutterError("PositionType returned nonexistent value\n"
          "Report this issue on [on_connectivity_widget] Github.");
  }
}

/// Choose what animation will be shown based in position.
Animation<Offset> getAnimation(
    PositionType position, AnimationController _controller, Curve? _animation) {
  switch (position.index) {
    case 0:
      return onTopAnim(_controller, _animation);
    case 1:
      return onBottomAnim(_controller, _animation);
    case 2:
      return onTopAndBottomLeftAnim(_controller, _animation);
    case 3:
      return onTopAndBottomLeftAnim(_controller, _animation);
    case 4:
      return onTopAndBottomRightAnim(_controller, _animation);
    case 5:
      return onTopAndBottomRightAnim(_controller, _animation);
    default:
      throw FlutterError("Position(getAnimation) returned nonexistent value\n"
          "Report this issue on [on_connectivity_widget] Github.");
  }
}
