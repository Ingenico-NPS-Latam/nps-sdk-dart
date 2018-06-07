import 'package:http/http.dart';

import 'deserializer.dart';
import 'serializer.dart';
import 'utilities.dart';

sendRequest(nps, params, method) async {
  var httpRequest = toXml(params, method);
  Response httpResponse = await post(
      nps.environment,
      headers: {
        "SOAPAction": method,
        "Content-Type": "text/xml; charset=utf-8",
        "Host": nps.chooseHost()
      },
      body: httpRequest.toXmlString()
  );
  stringPrettyPrint(httpResponse.body);

  return toMap(httpResponse, method + "Response");
}