import 'dart:convert';

import 'package:xml2json/xml2json.dart';

Map toMap(httpResponse, methodResponse) {
  final Xml2Json myTransformer = new Xml2Json();
  myTransformer.parse(httpResponse.body);

  String json = myTransformer.toParker();

  Map decoded_json = JSON.decode(json);

  return decoded_json["SOAP-ENV:Envelope"]["SOAP-ENV:Body"][methodResponse]["Respuesta"];
}
