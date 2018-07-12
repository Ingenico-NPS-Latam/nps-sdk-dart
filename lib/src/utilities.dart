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

bool isLessEqualThan(value, size) => value.length <= size;

bool isMoreEqualThan(value, size) => value.length >= size;

bool hasCorrectSize(String value, {int maxSize, int minSize}) {
  return isLessEqualThan(value, maxSize) && isMoreEqualThan(value, minSize);
}

int _calculate(luhn) {
  var sum = luhn.split("").map((e) => int.parse(e, radix:10)).reduce((a,b) => a + b);

  var delta = [0,1,2,3,4,-4,-3,-2,-1,0];
  for (var i=luhn.length-1; i >= 0; i-=2 ) {
    sum += delta[int.parse(luhn.substring(i,i+1), radix:10)];
  }

  var mod10 = 10 - (sum % 10);
  return mod10==10 ? 0 : mod10;
}

bool isValidLuhn(String cardNumber) {
  var luhnDigit = int.parse(cardNumber.substring(cardNumber.length-1,cardNumber.length), radix:10);
  var luhnLess = cardNumber.substring(0,cardNumber.length-1);
  return (_calculate(luhnLess) == luhnDigit);
}


