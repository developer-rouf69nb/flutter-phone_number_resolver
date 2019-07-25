# Flutter Phone Number Resolver

 ##### A flutter plugin for resolving user phone number from android telephony manager. Currently support only Android PLatform.

### Usage

 ###### To use this plugin, add url_launcher as a [dependency in your pubspec.yaml file.](https://flutter.dev/docs/development/packages-and-plugins/using-packages)


### Example

```dart
Future<void> initPlatformState() async {
String number = await PhoneNumberResolver.resolveLine1();

        if (!mounted) return;
        setState(() {
        _phoneNumber = number;
        });
}
```