# on_connectivity_widget

[![Pub.dev](https://img.shields.io/pub/v/on_connectivity_widget?color=9cf&label=Pub.dev&style=flat-square)](https://pub.dev/packages/on_connectivity_widget)
[![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20IOS%20%7C%20Web%20%7C%20MacOs%20%7C%20Linux%20%7C%20Windows-9cf?&style=flat-square)](https://www.android.com/)
[![Flutter](https://img.shields.io/badge/Language-Flutter%20%7C%20Null--Safety-9cf?logo=flutter&style=flat-square)](https://www.flutter.dev/)

`on_connectivity_widget` é um [Flutter](https://flutter.dev/) Package usado para escultar os estados da internet e mostrar uma menssagem customizável para o aplicativo.

Esse Plugin usa [connectivity_plus](https://pub.dev/packages/connectivity_plus) como dependência para escultar os estados da internet.

## Ajuda:

**Algum problema? [Issues](https://github.com/LucasPJS/on_connectivity_widget/issues)** <br>
**Alguma sugestão? [Pull request](https://github.com/LucasPJS/on_connectivity_widget/pulls)**

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
  on_connectivity_widget: ^1.0.0
```

## Como usar:

```dart
OnConnectivityWidget() // O widget principal para usar o plugin.
```
Todos os tipos de métodos nesse plugin:

|  Parameters  |   Arguments   |   Description   |
|--------------|-----------------|-----------------|
| `position` | `PositionType?` | `Usado para definir a posição da menssagem` | <br>
| `wifiWidget` | `Widget?` | `Widget mostrado quando a internet é: Wifi.` | <br>
| `mobileWidget` | `Widget?` | `Widget mostrado quando a internet é: Mobile` | <br>
| `noneWidget` | `Widget?` | `Widget mostrado quando a internet é: Offline.` | <br>
| `animationDuration` | `Duration?` | `Usado para definir quanto tempo a animação irá durar.` | <br>
| `messageDuration` | `Duration?` | `Usado para definir quanto tempo a menssagem irá durar.` | <br>
| `animationType` | `Curve?` | `Usado para definir qual animação será mostrada.` | <br>
| `cancelInitState` | `bool?` | `Usado para definir se menssagem será mostrada quando app iniciar.` | <br>
| `customAnimation` | `Animation<Offset>?` | `Usado se você quer usar sua própria animação.` | <br>
| `customPosition` | `Alignment?` | `Usado se você quer usar sua própria posição.` | <br>

**Veja mais em [Documentation](https://pub.dev/documentation/on_connectivity_widget/latest/on_connectivity_widget/on_connectivity_widget-library.html)**

## Exemplo:

#### OnConnectivityWidget
```dart
  OnConnectivityWidget(
    animationDuration: Duration(seconds: 2),
    messageDuration: Duration(seconds: 1),
    position: PositionType.BOTTOM,
    animationType: Curves.bounceInOut,
    cancelInitState: true,
    wifiWidget: Container(
    color: Colors.green,
      child: Text("Wifi"),
    ),
    mobileWidget: Container(
    color: Colors.blue,
      child: Text("Mobile"),
    ),
    noneWidget: Container(
    color: Colors.red,
      child: Text("None"),
    ),
    //customAnimation: null,
    //customPosition: null,
  );
```

## LICENÇA:

* [LICENSE](https://github.com/LucasPJS/on_connectivity_widget/blob/main/LICENSE)

> * [Voltar ao Topo](#on_connectivity_widget)
