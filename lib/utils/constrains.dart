import 'package:flutter/material.dart';

class Constrains {
  static double appBarHeight = 400;
  static String createAccount = "Create Account";
  static RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{7,}$');

  static Icon validateIcon = Icon(
    Icons.check_circle_outline_rounded,
    color: const Color(0xFF376AED),
    size: 20,
  );
}
