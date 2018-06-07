import 'package:xml/xml.dart' show XmlBuilder, XmlNode;

void build(builder, key, value) {
  builder.element(key, nest: () {
    if(value is List) {
      buildList(builder, key, value);
    } else if (value is Map) {
      buildMap(builder, key, value);
    } else {
      buildString(builder, key, value);
    }
  });
}

void buildList(builder, key, value) {
  builder.element(key, nest: () {
      for (var element in key) {
        element.forEach((key, value) => build(builder, key, value));
      }
  });
}

void buildMap(builder, key, value) {
  value.forEach((intern_key, intern_value) => build(builder, intern_key, intern_value));
}

void buildString(builder, key, value) {
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
