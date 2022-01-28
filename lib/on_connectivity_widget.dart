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

library on_connectivity_widget;

//Dart/Flutter
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:on_toast_widget/on_toast_widget.dart';

//Widget
part 'details/on_connectivity_widget.dart';

//Types
part 'details/types/position_types.dart';

//Utils
part 'details/utils/widget_util.dart';

//Default Widgets
part 'details/widgets/on_none_widget.dart';
part 'details/widgets/on_mobile_widget.dart';
part 'details/widgets/on_wifi_widget.dart';
