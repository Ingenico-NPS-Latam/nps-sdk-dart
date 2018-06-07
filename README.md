# Dart SDK

## Availability
Supports Dart from 1.2 to 2.0

## How to install

Add the following line in dependencies in your pubspec.yaml file:
```
dependencies:
  nps_sdk: "^0.0.3"
```

Then open a terminal in your project and execute the following command:
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
  response.then((resp) => print(resp["psp_ResponseCod"]))
          .catchError((error) => print);
}
```

You can also print all the response in the console instead of just accessing to one key:
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
            print(resp["psp_ResponseCod"]);
            jsonPrettyPrint(resp);
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


