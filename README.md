# on_connectivity_widget

[![Pub.dev](https://img.shields.io/pub/v/on_connectivity_widget?color=9cf&label=Pub.dev&style=flat-square)](https://pub.dev/packages/on_connectivity_widget)
[![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20IOS%20%7C%20Web%20%7C%20MacOs%20%7C%20Linux%20%7C%20Windows-9cf?&style=flat-square)](https://www.android.com/)
[![Flutter](https://img.shields.io/badge/Language-Flutter%20%7C%20Null--Safety-9cf?logo=flutter&style=flat-square)](https://www.flutter.dev/)

`on_connectivity_widget` is a [Flutter](https://flutter.dev/) Package used to listen network states and show a custom message to application.

This Plugin uses [connectivity_plus](https://pub.dev/packages/connectivity_plus) as dependency to listen network states
and [on_toast_widget](https://pub.dev/packages/on_toast_widget) to show custom and animated messages.

## Help:

**Any problem? [Issues](https://github.com/LucJosin/on_connectivity_widget/issues)** <br>
**Any suggestion? [Pull request](https://github.com/LucJosin/on_connectivity_widget/pulls)**

### Translations:

NOTE: Feel free to help with readme translations

* [English](README.md)
* [Portuguese](README.pt-BR.md)

### Topics:

* [How to Install](#how-to-install)
* [How to use](#how-to-use)
* [Example](#example)
* [License](#license)

<!-- ## Gif Examples:
| <img src=""/> | <img src=""/> | <img src=""/> | <img src=""/> |
|:---:|:---:|:---:|:---:|
| TOP | BOTTOM | LEFT_TOP | LEFT_BOTTOM | -->

## How to Install:
Add the following code to your `pubspec.yaml`:
```yaml
dependencies:
  on_connectivity_widget: ^1.0.2+1
```

## Some Features:

* Everytime network state change, will shown a message.
* All message has a default widget, but, you can create your own.
* You can define Animation type. 
* You can create/set your own Animation. 
* You can define how long Animation will last.
* You can define Position type. 
* You can create/set your own Position. 
* You can define how long Position will last.

## TODO:

* Fix bugs.
* Add more default animations.
* Add more `[Features]`

## How to use:

```dart
OnConnectivityWidget() // The main widget to start using the plugin.
```
All types of parameters on this plugin:

|  Parameters  |   Arguments   |   Description   |
|--------------|-----------------|-----------------|
| `position` | `PositionType?` | `Used to define message position` | <br>
| `wifiWidget` | `Widget?` | `Widget shown when network state is: Wifi.` | <br>
| `mobileWidget` | `Widget?` | `Widget shown when network state is: Mobile` | <br>
| `noneWidget` | `Widget?` | `Widget shown when network state is: Offline.` | <br>
| `animationDuration` | `Duration?` | `Used to define how long animation will last.` | <br>
| `messageDuration` | `Duration?` | `Used to define how long message will last.` | <br>
| `messageDurationWhenOnline` | `Duration?` | `Used to define how long message will after [showNoneUntilOnline].` | <br>
| `animationType` | `Curve?` | `Used to define what animation type will be shown.` | <br>
| `cancelInitState` | `bool?` | `Used to define if message will shown when application starts.` | <br>
| `showNoneUntilOnline` | `bool?` | `Used to define if message will await until network connect.` | <br>
| `customAnimation` | `Animation<Offset>?` | `Used if you want use your own animation.` | <br>
| `customPosition` | `Alignment?` | `Used if you want use your own position.` | <br>

**See more in [Documentation](https://pub.dev/documentation/on_connectivity_widget/latest/on_connectivity_widget/on_connectivity_widget-library.html)**

## Example:

#### OnConnectivityWidget
```dart
  OnConnectivityWidget(
    animationDuration: Duration(seconds: 1),
    messageDuration: Duration(seconds: 2),
    position: PositionType.BOTTOM,
    showNoneUntilOnline: true,
    messageDurationWhenOnline: Duration(seconds: 2),
    animationType: Curves.bounceInOut,
    cancelInitState: false,
    wifiWidget: Container(
      height: 60,
      width: double.infinity,
      color: Colors.green,
      child: Center(child: Text("Wifi")),
    ),
    mobileWidget: Container(
      height: 60,
      width: double.infinity,
      color: Colors.blue,
      child: Center(child: Text("Mobile")),
    ),
    noneWidget: Container(
      height: 60,
      width: double.infinity,
      color: Colors.red,
      child: Center(child: Text("None")),
    ),
    //customAnimation: null,
    //customPosition: null,
  ),;
```

## LICENSE:

* [LICENSE](https://github.com/LucJosin/on_connectivity_widget/blob/main/LICENSE)

> * [Back to top](#on_connectivity_widget)
