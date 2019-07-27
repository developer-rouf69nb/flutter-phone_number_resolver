import 'dart:async';
import 'package:flutter/services.dart';

class PhoneNumberResolver {
  static const MethodChannel _channel = const MethodChannel('phone_number_resolver');

  static Future<String> resolveLine1() async {
    return await _channel.invokeMethod('getDefaultPhoneNumber');
  }
}
