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

SlidePositionType checkPosition(PositionType positionType) {
  switch (positionType) {
    case PositionType.TOP:
      return SlidePositionType.TOP;
    case PositionType.BOTTOM:
      return SlidePositionType.BOTTOM;
    case PositionType.LEFT_TOP:
      return SlidePositionType.LEFT_TOP;
    case PositionType.LEFT_BOTTOM:
      return SlidePositionType.LEFT_BOTTOM;
    case PositionType.RIGHT_TOP:
      return SlidePositionType.RIGHT_TOP;
    case PositionType.RIGHT_BOTTOM:
      return SlidePositionType.RIGHT_BOTTOM;
    default:
      throw FlutterError("checkPosition returned nonexistent value\n"
          "Report this issue on [on_connectivity_widget] Github.");
  }
}
