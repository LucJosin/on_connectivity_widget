/*
=============
Author: Lucas Josino
Github: https://github.com/LucJosin
Website: https://www.lucasjosino.com/
=============
Plugin/Id: on_connectivity_widget#1
Homepage: https://github.com/LucJosin/on_connectivity_widget
Pub: https://pub.dev/packages/on_connectivity_widget
License: https://github.com/LucJosin/on_connectivity_widget/blob/main/LICENSE
Copyright: © 2022, Lucas Josino. All rights reserved.
=============
*/

part of on_connectivity_widget;

/// Main Widget for use on_connectivity_widget
///
/// This Widget will listen and show a custom message everytime network state change.
///
/// Example:
///
/// ```dart
/// OnConnectivityWidget(
///   animationDuration: Duration(seconds: 2),
///   messageDuration: Duration(seconds: 1),
///   position: SlidePositionType.BOTTOM,
///   animationType: Curves.bounceInOut,
///   cancelInitState: true,
///   bluetoothWidget: Container(
///     color: Colors.lightGreen,
///     child: Text("Bluetooth"),
///   ),
///   wifiWidget: Container(
///     color: Colors.green,
///     child: Text("Wifi"),
///   ),
///   ethernetWidget: Container(
///     color: Colors.lightBlue,
///     child: Text("Ethernet"),
///   ),
///   mobileWidget: Container(
///     color: Colors.blue,
///     child: Text("Mobile"),
///   ),
///   noneWidget: Container(
///     color: Colors.red,
///     child: Text("None"),
///   ),
///   //customAnimation: null,
///   //customPosition: null,
/// );
/// ```
///
/// Important:
///
/// * If [customAnimation] is't null, [animationType] need to be null.
/// * If [customPosition] is't null, [position] need to be null.
class OnConnectivityWidget extends StatefulWidget {
  /// [position] is used to define message position.
  ///
  /// Important:
  ///
  /// * If [position] is null, will be set to [Bottom].
  final SlidePositionType? position;

  /// [bluetoothWidget] the Widget shown when network state is: Bluetooth.
  ///
  /// Important:
  ///
  /// * If [bluetoothWidget] is null, will be set to [OnBluetoothWidget].
  final Widget? bluetoothWidget;

  /// [wifiWidget] the Widget shown when network state is: Wifi.
  ///
  /// Important:
  ///
  /// * If [wifiWidget] is null, will be set to [OnWifiWidget].
  final Widget? wifiWidget;

  /// [EthernetWidget] the Widget shown when network state is: Ethernet.
  ///
  /// Important:
  ///
  /// * If [EthernetWidget] is null, will be set to [OnEthernetWidget].
  final Widget? ethernetWidget;

  /// [mobileWidget] the Widget shown when network state is: Mobile.
  ///
  /// Important:
  ///
  /// * If [mobileWidget] is null, will be set to [OnMobileWidget].
  final Widget? mobileWidget;

  /// [noneWidget] the Widget shown when network state is: Offline.
  ///
  /// Important:
  ///
  /// * If [noneWidget] is null, will be set to [OnNoneWidget].
  final Widget? noneWidget;

  /// [animationDuration] is used to define how long animation will last.
  ///
  /// Important:
  ///
  /// * If [animationDuration] is null, will be set to [1 Second].
  final Duration? animationDuration;

  /// [messageDuration] is used to define how long message will last.
  ///
  /// Important:
  ///
  /// * If [messageDuration] is null, will be set to [1 Second].
  final Duration? messageDuration;

  /// [messageDurationWhenOnline] is used to define how long message will after [showNoneUntilOnline].
  ///
  /// Important:
  ///
  /// * If [messageDurationWhenOnline] is null, will be set to [1 Second].
  final Duration? messageDurationWhenOnline;

  /// [animationType] is used to define what animation type will be shown.
  ///
  /// Important:
  ///
  /// * If [animationType] is null, will be set to [linearToEaseOut].
  final Curve? animationType;

  /// [cancelInitState] is used to define if message will shown when application starts.
  ///
  /// Important:
  ///
  /// * If [cancelInitState] is null, will be set to [true].
  final bool? cancelInitState;

  /// [showNoneUntilOnline] is used to define if message will await until network connect.
  ///
  /// Important:
  ///
  /// * If [showNoneUntilOnline] is null, will be set to [true].
  final bool? showNoneUntilOnline;

  /// [customAnimation] if you want use your own animation.
  ///
  /// Important:
  ///
  /// * If [customAnimation] is't null, [animationType] need to be null.
  final Animation<Offset>? customAnimation;

  /// [customPosition] if you want use your own position.
  ///
  /// Important:
  ///
  /// * If [customPosition] is't null, [position] need to be null.
  final Alignment? customPosition;

  /// Main Widget for use on_connectivity_widget
  ///
  /// This Widget will listen and show a custom message everytime network state change.
  ///
  /// Important:
  ///
  /// * If [customAnimation] is't null, [animationType] need to be null.
  /// * If [customPosition] is't null, [position] need to be null.
  const OnConnectivityWidget({
    Key? key,
    this.bluetoothWidget,
    this.mobileWidget,
    this.ethernetWidget,
    this.noneWidget,
    this.wifiWidget,
    this.position,
    this.cancelInitState,
    this.customAnimation,
    this.customPosition,
    this.messageDuration,
    this.messageDurationWhenOnline,
    this.animationDuration,
    this.animationType,
    this.showNoneUntilOnline = true,
  })  : assert(customAnimation == null || animationType == null,
            "Cannot provide both a customAnimation and a showAnimation/"),
        assert(customPosition == null || position == null,
            "Cannot provide both a customPosition and a position"),
        super(key: key);

  // Flutter
  @override
  _OnConnectivityWidgetState createState() => _OnConnectivityWidgetState();
}

class _OnConnectivityWidgetState extends State<OnConnectivityWidget>
    with SingleTickerProviderStateMixin {
  // Setup connectivity_plus result and connectivity listener.
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _streamSubscription;

  //
  late bool _cancelInitState;
  bool _awaitingInNone = false;

  // Animation Controller.
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.animationDuration ?? const Duration(seconds: 1),
  )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.showNoneUntilOnline == false
            ? setTimerAndReverse()
            : _connectivityResult != ConnectivityResult.none
                ? setTimerAndReverse()
                : _awaitingInNone = true;
      }
    });

  void setTimerAndReverse() {
    Timer(widget.messageDuration ?? const Duration(seconds: 1), () {
      setState(() {
        _controller.reverse();
      });
    });
  }

  // Update result everytime network changes status.
  void updateConnectivity(ConnectivityResult result) {
    setState(() {
      _connectivityResult = result;
      // Check awaitInNone state
      _awaitingInNone == true
          ? Timer(
              widget.messageDurationWhenOnline ?? const Duration(seconds: 1),
              () {
              setState(() {
                _controller.reverse();
              });
            })
          : _cancelInitState == false
              ? _controller.forward()
              : _controller.stop();
      _cancelInitState = false;
      _awaitingInNone = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // If [cancelInitState] is null, set to true, so, message don't show in application initialization.
    _cancelInitState = widget.cancelInitState ?? true;
    // Listening network status.
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      _connectivityResult = event;
      updateConnectivity(event);
    });
  }

  // Cancel listener for better performace.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // Message Widget.
    // Custom Animation
    if (widget.customAnimation != null) {
      return Container(
        alignment: widget.customPosition,
        child: SlideTransition(
          position: widget.customAnimation!,
          child: getWidgetBasedInResult(
            _connectivityResult,
            bluetoothWidget: widget.bluetoothWidget,
            wifiWidget: widget.wifiWidget,
            ethernetWidget: widget.ethernetWidget,
            mobileWidget: widget.mobileWidget,
            noneWidget: widget.noneWidget,
          ),
        ),
      );
    } else {
      // TODO("Add option for others animations from [on_toast_widget]")
      // Default Animation
      return OnToastWidget(
        controller: _controller,
        animationType: widget.animationType ?? Curves.linearToEaseOut,
        effectType: EffectType.SLIDE,
        slidePositionType: widget.position ?? SlidePositionType.BOTTOM,
        automaticallyReverse: false,
        child: getWidgetBasedInResult(
          _connectivityResult,
          bluetoothWidget: widget.bluetoothWidget,
          wifiWidget: widget.wifiWidget,
          ethernetWidget: widget.ethernetWidget,
          mobileWidget: widget.mobileWidget,
          noneWidget: widget.noneWidget,
        ),
      );
    }
  }
}

//
// Extras:
//
// #ConnectivityResult:
//  * Wifi
//  * Mobile
//  * None
//
// #AnimationStatus:
//  * Dismissed
//  * Forward
//  * Reverse
//  * Completed
//
