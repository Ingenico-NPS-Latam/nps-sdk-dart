import 'dart:async';

import './lib/nps_sdk.dart';

main(List<String> arguments) async {
  Nps nps = new Nps(sandbox);

  //CL: DKpsqwd9JCJqnEda2sODtCsThBq6aPL0Kmm72ZHhBjFqvsesid0bBCbeh091xtNK
  //PMT: AKhk5mFO0QG0lMevSFR4hlxGggADFdYc
  //PM: jLNvnLt1Hwxv7bqBgitCJ0qVdnezg3pk
  
  Map retrievePaymentMethodTokenParams = {
        "psp_Version": "2.2",
        "psp_MerchantId": "sdk_test",
        "psp_PaymentMethodToken": "AKhk5mFO0QG0lMevSFR4hlxGggADFdYc",
        "psp_ClientSession": "DKpsqwd9JCJqnEda2sODtCsThBq6aPL0Kmm72ZHhBjFqvsesid0bBCbeh091xtNK",
        "psp_PosDateTime": "2008-01-12 13:05:00"
    };

  Future response = nps.retrievePaymentMethodToken(nps, retrievePaymentMethodTokenParams);
  response
    .then((resp) {
    })
    .catchError((error) {
      print;
    });
}