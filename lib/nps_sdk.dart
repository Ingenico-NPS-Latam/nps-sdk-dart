library nps_sdk;

import 'src/constants.dart' as constants;
import 'src/services.dart' as services;
import 'src/utilities.dart' as utilities;
import 'src/soap_client.dart';

export 'src/constants.dart';
export 'src/deserializer.dart';
export 'src/serializer.dart';
export 'src/services.dart';
export 'src/utilities.dart';
export 'src/soap_client.dart';

class Nps {
  String _environment;
  bool _debug = false;

  final sandbox_host = "sandbox.nps.com.ar";
  final staging_host = "implementacion.nps.com.ar";
  final production_host = "services2.nps.com.ar";

  Nps(this._environment);

  String get environment => _environment;

  bool get logging => _debug;

  set logging(bool state) => _debug = state;

  String chooseHost() {
    if (_environment == constants.sandbox) {
      return sandbox_host;
    } else if (_environment == constants.production) {
      return production_host;
    } else {
      return staging_host;
    }
  }

  createPaymentMethodToken(nps, params) {
    var response = sendRequest(nps, params, services.createPaymentMethodToken);
    return response;
  }

  getINNDetails(nps, params) {
    var response = sendRequest(nps, params, services.getIINDetails);
    return response;
  }

  getInstallmentsOptions(nps, params) {
    var response = sendRequest(nps, params, services.getInstallmentsOptions);
    return response;
  }

  recachePaymentMethodToken(nps, params) {
    var response = sendRequest(nps, params, services.recachePaymentMethodToken);
    return response;
  }

  retrievePaymentMethodToken(nps, params) {
    var response = sendRequest(nps, params, services.retrievePaymentMethodToken);
    return response;
  }

  bool validateCardNumber(String cardNumber) => utilities.hasCorrectSize(cardNumber, maxSize: 24, minSize: 9) && utilities.isValidLuhn(cardNumber);

  bool validateCardHolderName(String holderName) => utilities.hasCorrectSize(holderName, maxSize: 27, minSize: 2);

  bool validateCardSecurityCode(String securityCode) => utilities.hasCorrectSize(securityCode, maxSize: 4, minSize: 3);

  bool validateCardExpDate(int year, {int month}) {
    int day = 1;
    if (month < 1 || month > 12 || year < 1) {
      return false;
    }

    year += year < 100 ? 2000 : 0;

    DateTime today = new DateTime.now();
    DateTime cardExpDate = DateTime.parse(year.toString() + "0" + month.toString() + "0" + day.toString());
    Duration difference = cardExpDate.difference(today);
    return difference.inDays > 0;
  }
}


