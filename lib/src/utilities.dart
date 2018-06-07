import 'dart:convert';

import 'package:xml/xml.dart';

void stringPrettyPrint(text) {
  print(parse(text).toXmlString(pretty: true, indent: '\t'));
}

void jsonPrettyPrint(json) {
  if(json != null) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String prettyJson = encoder.convert(json);
    print(prettyJson);
  }
}


