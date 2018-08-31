# Dart SDK

## Availability
Supports Dart from 2.0 to above

## How to install

Add the following line in dependencies in your pubspec.yaml file and save it:
```
dependencies:
  nps_sdk: "^1.0.0"
```

If ```pub get``` wasn't automatically ejecuted, you can do it manually by opening a terminal in your project and executing the command:
```
pub get
```

Now you are ready to import our SDK:
```dart
import 'package:nps_sdk/nps_sdk.dart';
```

## Configuration

It's a basic configuration of the SDK

```dart
import 'dart:async';

import 'package:nps_sdk/nps_sdk.dart';

main(List<String> arguments) async {
  Nps nps = new Nps(sandbox);
}
```

Here is an simple example request:
```dart
import 'dart:async';

import 'package:nps_sdk/nps_sdk.dart';

main(List<String> arguments) async {
  Nps nps = new Nps(sandbox);

  Map createPaymentMethodTokenParams = {
    "psp_Version": "2.2",
    "psp_MerchantId": "sdk_test",
    "psp_CardInputDetails": {
      "Number": "4507990000000010",
      "ExpirationDate": "2501",
      "SecurityCode": "123",
      "HolderName": "JOHN DOE"
    },
    "psp_ClientSession": "YOUR_CLIENT_SESSION_HERE"
  };

  Future response = nps.createPaymentMethodToken(nps, createPaymentMethodTokenParams);
  response.then((resp) {
            print(resp["psp_ResponseCod"]); //Only one key
            jsonPrettyPrint(resp); //All the XML
          })
          .catchError((error) => print);
}
```


## Environments

```dart
import 'package:nps_sdk/nps_sdk.dart';

Nps nps = new Nps(sandbox);
Nps nps = new Nps(staging);
Nps nps = new Nps(production);
```

## Error handling

With this SDK you will be able to handle errors as you prefer.
In order to do this, you just need to specify what you want to do with the error in the catchError callback:
```dart
import 'dart:async';

import 'package:nps_sdk/nps_sdk.dart';

main(List<String> arguments) async {
    //Code
    
    Future response = nps.createPaymentMethodToken(nps, createPaymentMethodTokenParams);
      response.then((resp) => print(resp["psp_ResponseCod"]))
              .catchError((error) {
                //Your code to handle the error
              });
}
```

## Flutter 

This SDK can be imported in Flutter's projects. For a Flutter example, click [here](https://github.com/Ingenico-NPS-Latam/nps-sdk-dart/tree/master/example/flutter_example).

