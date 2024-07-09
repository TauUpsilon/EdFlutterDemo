part of '../json_paramable_generator.dart';

class JsonParamableGenerator extends GeneratorForAnnotation<JsonParamable> {
  var _visitor = JsonParamableVisitor();

  String get className => _visitor.className;
  String get viewName => _visitor.viewName;

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final isAnnotatedWithJsonSerialisable = element.metadata
        .where(
          (element) => "$element".contains('@JsonSerializable'),
        )
        .isNotEmpty;

    if (!isAnnotatedWithJsonSerialisable) {
      throw Exception('Shoud annotated with JsonSerializable');
    }

    final buffer = StringBuffer();

    _visitor = JsonParamableVisitor();

    element.visitChildren(_visitor);

    buffer.writeln('class $className {');

    writePublicFields(buffer);

    buffer.writeln('\n');

    writeConstructor(buffer);

    buffer.writeln('\n');

    writeGetViewMethod(buffer);

    buffer.writeln('\n');

    writeToExtraMethod(buffer);

    buffer.writeln('}');

    return buffer.toString();
  }

  void writePublicFields(StringBuffer buffer) {
    if (_visitor.fields.isEmpty) return;

    for (final field in _visitor.fields) {
      if (!field.isFinal) continue;

      buffer.writeln(
        'final ${'${field.type}'.replaceFirst('*', '')} ${field.name};',
      );
    }
  }

  void writeConstructor(StringBuffer buffer) {
    if (_visitor.params.isEmpty) {
      buffer.writeln('const $className();');

      return;
    }

    buffer.writeln('const $className({');

    for (final param in _visitor.params) {
      if (param.isFinal && param.isOptional) {
        final defaultVal = param.defaultValueCode != null
            ? ' = ${param.defaultValueCode}'
            : '';
        buffer.writeln(
          'this.${param.name}$defaultVal,',
        );
      } else if (param.isFinal && param.isRequired) {
        buffer.writeln(
          'required this.${param.name},',
        );
      }
    }

    buffer.writeln('});');
  }

  void writeGetViewMethod(StringBuffer buffer) {
    // static View toView(Map<String, dynamic> json) =>
    //    _$ViewFromJson(json);

    buffer.writeln('static $viewName getView(Map<String, dynamic> json) => ');

    buffer.write('_\$${viewName}FromJson(json);');

    // if (_visitor.fields.isEmpty) return;

    // buffer.writeln(
    //   'factory $className.fromJson(Map<String, dynamic> json,) => ',
    // );

    // buffer.write('$className(');

    // for (final field in _visitor.fields) {
    //   if (!field.isFinal) continue;

    //   final fieldName = field.name;
    //   final fieldType =
    //       '${field.type}'.replaceFirst('*', '').replaceFirst('?', '');
    //   final typeElement = field.type.element;

    //   var mapValue = '';

    //   if (typeElement != null && typeElement.metadata.isNotEmpty) {
    //     final jsonAnnotatedElements = typeElement.metadata.where(
    //       (element) => "$element".contains('@JsonSerializable'),
    //     );

    //     if (jsonAnnotatedElements.isNotEmpty) {
    //       mapValue = "$fieldType.fromJson(json['$fieldName'],)";
    //       buffer.writeln("$fieldName: $mapValue,");
    //       continue;
    //     }
    //   }

    //   final filteredType = [
    //     'bool',
    //     'num',
    //     'int',
    //     'double',
    //     'Uri',
    //     'DateTime',
    //   ].where((type) => '${field.type}'.contains(type)).isNotEmpty;

    //   if (filteredType) {
    //     mapValue = "$fieldType.parse(json['$fieldName'])";
    //   } else {
    //     mapValue = "json['$fieldName']";
    //   }

    //   buffer.writeln("$fieldName: $mapValue,");
    // }

    // buffer.writeln(');');
  }

  void writeToExtraMethod(StringBuffer buffer) {
    // Map<String, dynamic> toParam() => _$ViewToJson(
    //     View(
    //       param: param,
    //     ),
    //   );

    buffer.writeln('Map<String, dynamic> toExtra() => _\$${viewName}ToJson(');

    buffer.writeln('$viewName(');

    for (final field in _visitor.fields) {
      buffer.writeln("${field.name}: ${field.name},");
    }

    buffer.writeln('),');

    buffer.writeln(');');

    // if (_visitor.fields.isEmpty) return;

    // buffer.writeln(
    //   'Map<String, dynamic> toJson($className instance) => ',
    // );

    // buffer.write('{');

    // for (final field in _visitor.fields) {
    //   final fieldName = field.name;

    //   buffer.writeln("'$fieldName': instance.$fieldName,");
    // }

    // buffer.writeln('};');
  }
}
