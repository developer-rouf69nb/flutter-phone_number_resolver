import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phone_number_resolver/phone_number_resolver.dart';

void main() {
  const MethodChannel channel = MethodChannel('phone_number_resolver');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await PhoneNumberResolver.resolveLine1, '42');
  });
}
