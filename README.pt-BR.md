# on_connectivity_widget

[![Pub.dev](https://img.shields.io/pub/v/on_connectivity_widget?color=9cf&label=Pub.dev&style=flat-square)](https://pub.dev/packages/on_connectivity_widget)
[![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20IOS%20%7C%20Web%20%7C%20MacOs%20%7C%20Linux%20%7C%20Windows-9cf?&style=flat-square)](https://www.android.com/)
[![Flutter](https://img.shields.io/badge/Language-Flutter%20%7C%20Null--Safety-9cf?logo=flutter&style=flat-square)](https://www.flutter.dev/)

`on_connectivity_widget` é um [Flutter](https://flutter.dev/) Package usado para escultar os estados da internet e mostrar uma menssagem customizável para o aplicativo.

Esse Plugin usa [connectivity_plus](https://pub.dev/packages/connectivity_plus) como dependência para escultar os estados da internet e usa [on_toast_widget](https://pub.dev/packages/on_toast_widget) para mostrar menssagem customizável e animada.

## Ajuda:

**Algum problema? [Issues](https://github.com/LucJosin/on_connectivity_widget/issues)** <br>
**Alguma sugestão? [Pull request](https://github.com/LucJosin/on_connectivity_widget/pulls)**

### Traduções:

NOTE: Fique à vontade para ajudar nas traduções

* [Inglês](README.md)
* [Português](README.pt-BR.md)

## Tópicos:

* [Como instalar](#como-instalar)
* [Como usar](#como-usar)
* [Exemplo](#exemplo)
* [Licença](#licença)

<!-- ## Gif Examples:
| <img src=""/> | <img src=""/> | <img src=""/> | <img src=""/> |
|:---:|:---:|:---:|:---:|
| TOP | BOTTOM | LEFT_TOP | LEFT_BOTTOM | -->

## Como instalar:
Adicione o seguinte codigo para seu `pubspec.yaml`:
```yaml
dependencies:
  on_connectivity_widget: ^1.1.0
```

## Para fazer:

* Arrumar erros.
* Adicionar mais animações.
* Adicionar mais `[Qualidades]`

## Como usar:

```dart
OnConnectivityWidget() // O widget principal para usar o plugin.
```
Todos os tipos de métodos nesse plugin:

|  Parameters  |   Arguments   |   Description   |
|--------------|-----------------|-----------------|
| `position` | `SlidePositionType?` | `Usado para definir a posição da menssagem` | <br>
| `bluetoothWidget` | `Widget?` | `Widget mostrado quando a conexão é: Bluetooth.` | <br>
| `wifiWidget` | `Widget?` | `Widget mostrado quando a internet é: Wifi.` | <br>
| `ethernetWidget` | `Widget?` | `Widget mostrado quando a internet é: Ethernet.` | <br>
| `mobileWidget` | `Widget?` | `Widget mostrado quando a internet é: Mobile` | <br>
| `noneWidget` | `Widget?` | `Widget mostrado quando a internet é: Offline.` | <br>
| `animationDuration` | `Duration?` | `Usado para definir quanto tempo a animação irá durar.` | <br>
| `messageDuration` | `Duration?` | `Usado para definir quanto tempo a menssagem irá durar.` | <br>
| `messageDurationWhenOnline` | `Duration?` | `Usado para definir quanto tempo a menssagem irá durar depois de [showNoneUntilOnline].` | <br>
| `animationType` | `Curve?` | `Usado para definir qual animação será mostrada.` | <br>
| `cancelInitState` | `bool?` | `Usado para definir se menssagem será mostrada quando app iniciar.` | <br>
| `showNoneUntilOnline` | `bool?` | `Usado para definir se menssagem será esperar até internet voltar.` | <br>
| `customAnimation` | `Animation<Offset>?` | `Usado se você quer usar sua própria animação.` | <br>
| `customPosition` | `Alignment?` | `Usado se você quer usar sua própria posição.` | <br>

**Veja mais em [Documentation](https://pub.dev/documentation/on_connectivity_widget/latest/on_connectivity_widget/on_connectivity_widget-library.html)**

## Exemplo:

#### OnConnectivityWidget
```dart
  OnConnectivityWidget(
    animationDuration: Duration(seconds: 1),
    messageDuration: Duration(seconds: 2),
    position: SlidePositionType.BOTTOM,
    showNoneUntilOnline: true,
    messageDurationWhenOnline: Duration(seconds: 2),
    animationType: Curves.bounceInOut,
    cancelInitState: false,
    bluetoothWidget: OnMessageWidget(
      title: 'You\'re online',
      desc: 'Your current connection is: Bluetooth',
      color: Colors.lightBlue[200]!,
      icon: Icons.check_circle_outline_rounded,
    ),
    wifiWidget: const OnMessageWidget(
      title: 'You\'re online',
      desc: 'Your current connection is: Wifi',
      color: Colors.green,
      icon: Icons.check_circle_outline_rounded,
    ),
    ethernetWidget: OnMessageWidget(
      title: 'You\'re online',
      desc: 'Your current connection is: Ethernet',
      color: Colors.lightGreen[200]!,
      icon: Icons.check_circle_outline_rounded,
    ),
    mobileWidget: const OnMessageWidget(
      title: 'You\'re online',
      desc: 'Your current connection is: Mobile',
      color: Colors.blue,
      icon: Icons.check_circle_outline_rounded,
    ),
    noneWidget: const OnMessageWidget(
      title: 'You\'re offline',
      desc: 'Your current connection is: Offline',
      color: Colors.red,
      icon: Icons.error_outline_rounded,
    ),
    //customAnimation: null,
    //customPosition: null,
  ),;
```

## LICENÇA:

* [LICENSE](https://github.com/LucJosin/on_connectivity_widget/blob/main/LICENSE)

> * [Voltar ao Topo](#on_connectivity_widget)
