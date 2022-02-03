part of on_connectivity_widget;

/// Choose what widget will be shown based in network state.
Widget getWidgetBasedInResult(
  ConnectivityResult _connectivityResult, {
  Widget? bluetoothWidget,
  Widget? wifiWidget,
  Widget? ethernetWidget,
  Widget? mobileWidget,
  Widget? noneWidget,
}) {
  switch (_connectivityResult.index) {
    case 0:
      return bluetoothWidget ??
          OnMessageWidget(
            title: 'You\'re online',
            desc: 'Your current connection is: Bluetooth',
            color: Colors.lightBlue[200]!,
            icon: Icons.check_circle_outline_rounded,
          );
    case 1:
      return wifiWidget ??
          const OnMessageWidget(
            title: 'You\'re online',
            desc: 'Your current connection is: Wifi',
            color: Colors.green,
            icon: Icons.check_circle_outline_rounded,
          );
    case 2:
      return ethernetWidget ??
          OnMessageWidget(
            title: 'You\'re online',
            desc: 'Your current connection is: Ethernet',
            color: Colors.lightGreen[200]!,
            icon: Icons.check_circle_outline_rounded,
          );
    case 3:
      return mobileWidget ??
          const OnMessageWidget(
            title: 'You\'re online',
            desc: 'Your current connection is: Mobile',
            color: Colors.blue,
            icon: Icons.check_circle_outline_rounded,
          );
    default:
      return noneWidget ??
          const OnMessageWidget(
            title: 'You\'re offline',
            desc: 'Your current connection is: Offline',
            color: Colors.red,
            icon: Icons.error_outline_rounded,
          );
  }
}
