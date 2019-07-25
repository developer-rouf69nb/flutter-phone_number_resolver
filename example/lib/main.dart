import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:phone_number_resolver/phone_number_resolver.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _phoneNumber = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String number = await PhoneNumberResolver.resolveLine1();

    if (!mounted) return;
    setState(() {
      _phoneNumber = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Running on: $_phoneNumber\n'),
              RaisedButton(
                onPressed: _onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    initPlatformState();
  }
}
