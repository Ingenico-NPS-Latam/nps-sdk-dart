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
    "psp_ClientSession": "YOUR_CLIENT_SESSION"
  };

  Future response = nps.createPaymentMethodToken(nps, createPaymentMethodTokenParams);
  response.then((resp) => jsonPrettyPrint(resp))
          .catchError((error) => print);
}