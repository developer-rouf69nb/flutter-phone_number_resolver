# Flutter Phone Number Resolver

 ##### A flutter plugin for resolving user phone number from android telephony manager. Currently support only Android Platform.

### Usage

 ###### To use this plugin, add url_launcher as a [dependency in your pubspec.yaml file.](https://flutter.dev/docs/development/packages-and-plugins/using-packages)


### Example

```dart
PhoneNumberResolver.resolveLine1()
    .then((x){
      if (!mounted) return;
      setState(() {
        _phoneNumber = x;
      });
    }).catchError((e)=>
        print(e)
    );
```