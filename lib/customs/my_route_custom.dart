import 'package:flutter/material.dart';

class MyRoute extends MaterialPageRoute {
  MyRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => Duration(seconds: 1);

  @override
  // TODO: implement reverseTransitionDuration
  Duration get reverseTransitionDuration => Duration(milliseconds: 500);
}
