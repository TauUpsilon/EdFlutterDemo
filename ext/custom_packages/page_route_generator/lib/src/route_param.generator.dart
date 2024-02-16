// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:page_route_annotation/page_route.annotation.dart';
import 'package:page_route_generator/src/page_class.visitor.dart';
import 'package:source_gen/source_gen.dart';

class RouteParamGenerator extends GeneratorForAnnotation<RouteParamGenerable> {
  var _visitor = PageClassVisitor();

  String get className => _visitor.className;

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final buffer = StringBuffer();

    _visitor = PageClassVisitor();

    element.visitChildren(_visitor);

    buffer.writeln('class $className {');

    writePublicFields(buffer);

    buffer.writeln('\n');

    writeConstructor(buffer);

    buffer.writeln('\n');

    writeFromJsonMethod(buffer);

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

  void writeFromJsonMethod(StringBuffer buffer) {
    if (_visitor.fields.isEmpty) return;

    buffer.writeln(
      'factory $className.fromJson(Map<String, dynamic> json,) => ',
    );

    buffer.write('$className(');

    for (final field in _visitor.fields) {
      if (!field.isFinal) continue;

      final fieldName = field.name;
      final fieldType =
          '${field.type}'.replaceFirst('*', '').replaceFirst('?', '');
      final typeElement = field.type.element;

      var mapValue = '';

      if (typeElement != null && typeElement.metadata.isNotEmpty) {
        final jsonAnnotatedElements = typeElement.metadata.where(
          (element) => "$element".contains('@JsonSerializable'),
        );

        if (jsonAnnotatedElements.isNotEmpty) {
          mapValue = "$fieldType.fromJson(json['$fieldName'],)";
          buffer.writeln("$fieldName: $mapValue,");
          continue;
        }
      }

      final filteredType = [
        'bool',
        'num',
        'int',
        'double',
        'Uri',
        'DateTime',
      ].where((type) => '${field.type}'.contains(type)).isNotEmpty;

      if (filteredType) {
        mapValue = "$fieldType.parse(json['$fieldName'])";
      } else {
        mapValue = "json['$fieldName']";
      }

      buffer.writeln("$fieldName: $mapValue,");
    }

    buffer.writeln(');');
  }
}
