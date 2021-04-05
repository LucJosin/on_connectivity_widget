/*
Author: Lucas Josino
Github: https://github.com/LucasPJS
Package: on_connectivity_widget
Homepage: https://github.com/LucasPJS/on_connectivity_widget
Copyright: © 2021, Lucas Josino. All rights reserved.
License: https://github.com/LucasPJS/on_connectivity_widget/blob/main/LICENSE
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
///   position: PositionType.BOTTOM,
///   animationType: Curves.bounceInOut,
///   cancelInitState: true,
///   wifiWidget: Container(
///     color: Colors.green,
///     child: Text("Wifi"),
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
  final PositionType? position;

  /// [wifiWidget] the Widget shown when network state is: Wifi.
  ///
  /// Important:
  ///
  /// * If [wifiWidget] is null, will be set to [OnWifiWidget].
  final Widget? wifiWidget;

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
  const OnConnectivityWidget(
      {Key? key,
      this.position,
      this.cancelInitState,
      this.customAnimation,
      this.customPosition,
      this.mobileWidget,
      this.noneWidget,
      this.wifiWidget,
      this.messageDuration,
      this.animationDuration,
      this.animationType})
      : assert(customAnimation == null || animationType == null,
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

  // Animation Controller.
  late AnimationController _controller = AnimationController(
      vsync: this, duration: widget.animationDuration ?? Duration(seconds: 1))
    ..addListener(() {
      if (_controller.isCompleted) {
        Timer(widget.messageDuration ?? Duration(seconds: 1), () {
          setState(() {
            _controller.reverse();
          });
        });
      }
    });

  // Update result everytime network changes status.
  void updateConnectivity(ConnectivityResult result) {
    setState(() {
      _connectivityResult = result;
      _cancelInitState == false ? _controller.forward() : _controller.stop();
      _cancelInitState = false;
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
    _controller.stop();
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // Message Widget.
    return Container(
      // Check if [customPosition] is null, if so, will be set to [Bottom]
      alignment: widget.customPosition ??
          getAlignment(
            widget.position ?? PositionType.BOTTOM,
          ),
      // Widget used to create slide animation.
      child: SlideTransition(
        // Check if [customAnimation] is null, if so, will be set to position and animation defined before, if any.
        position: widget.customAnimation ??
            getAnimation(
              widget.position ?? PositionType.BOTTOM,
              _controller,
              widget.animationType,
            ),
        // Defines what type of widget will be shown.
        //
        // * Wifi [OnWifiWidget.dart].
        // * Mobile [OnMobileWidget.dart].
        // * None [OnNoneWidget.dart].
        child: getWidgetBasedInResult(
          // Network State.
          _connectivityResult,
          widget.wifiWidget,
          widget.mobileWidget,
          widget.noneWidget,
        ),
      ),
    );
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
