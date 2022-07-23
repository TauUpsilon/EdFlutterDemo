import 'dart:async';

import 'package:flutter/services.dart';

class CustomMath {
  static const MethodChannel _channel = MethodChannel('custom_math');

  static Future<double?> add(double a, double b) async {
    final double? result = await _channel.invokeMethod('add', [a, b]);

    return result;
  }

  static Future<double?> subtract(double a, double b) async {
    final double? result = await _channel.invokeMethod('subtract', [a, b]);

    return result;
  }

  static Future<double?> multiply(double a, double b) async {
    final double? result = await _channel.invokeMethod('multiply', [a, b]);

    return result;
  }

  static Future<double?> divide(double a, double b) async {
    final double? result = await _channel.invokeMethod('divide', [a, b]);

    return result;
  }
}
