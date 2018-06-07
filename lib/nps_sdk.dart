library nps_sdk;

import 'src/constants.dart' as constants;
import 'src/services.dart' as services;
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

  final sandbox_host = "www.sandbox.nps.com.ar";
  final staging_host = "www.implementacion.nps.com.ar";
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

  getInstallmentOptions(nps, params) {
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
}


