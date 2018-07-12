import 'package:xml/xml.dart' show XmlBuilder, XmlNode;

void build(builder, key, value) {
  builder.element(key, nest: () {
    if(value is List) {
      buildList(builder, key, value);
    } else if (value is Map) {
      buildMap(builder, value);
    } else {
      buildString(builder, value);
    }
  });
}

void buildList(builder, list, value) {
  builder.element(list, nest: () {
      for (var element in list) {
        element.forEach((key, value) => build(builder, key, value));
      }
  });
}

void buildMap(builder, dict) {
  dict.forEach((key, value) => build(builder, key, value));
}

void buildString(builder, value) {
  builder.attribute('xsi:type', 'string');
  builder.text(value);
}

XmlNode toXml(params, method) {
  XmlBuilder builder = new XmlBuilder();
  builder.processing('xml', 'version="1.0"');
  builder.element('SOAP-ENV:Envelope', nest: () {
    builder.element('SOAP-ENV:Body', nest: () {
      builder.element(method, nest: () {
        builder.element('Requerimiento', nest: () {
          builder.attribute('xsi:type', 'RequerimientoStruct_' + method);
          builder.text(
              params.forEach((k, v) => build(builder, k, v))
          );
        });
      });
    });
  });
  XmlNode request = builder.build();

  return request;
}
