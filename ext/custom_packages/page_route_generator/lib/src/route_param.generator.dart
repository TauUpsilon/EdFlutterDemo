// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:page_route_annotation/page_route.annotation.dart';
import 'package:page_route_generator/src/page_class.visitor.dart';
import 'package:source_gen/source_gen.dart';

class RouteParamGenerator extends GeneratorForAnnotation<RouteParamGenerable> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = PageClassVisitor();
    element.visitChildren(visitor);

    final buffer = StringBuffer();
    final className = '${visitor.className}RouteParam';

    buffer.writeln('class $className {');

    final countOfPrivateFields = visitor.fields.keys
        .where((element) => element.startsWith('_'))
        .toList()
        .length;

    final hasPublicFields =
        countOfPrivateFields == visitor.fields.keys.toList().length;

    if (visitor.fields.isNotEmpty && !hasPublicFields) {
      // Fields
      for (int i = 0; i < visitor.fields.length; i++) {
        if (visitor.fields.keys.elementAt(i).startsWith('_')) continue;

        buffer.writeln(
          'final ${visitor.fields.values.elementAt(i)} ${visitor.fields.keys.elementAt(i)};',
        );
      }

      buffer.writeln('\n');

      // Constructor
      buffer.writeln('const $className({');
      for (int i = 0; i < visitor.fields.length; i++) {
        if (visitor.fields.keys.elementAt(i).startsWith('_')) continue;

        final type = visitor.fields.values.elementAt(i);

        if (type.toString().contains('?')) {
          buffer.writeln(
            'this.${visitor.fields.keys.elementAt(i)},',
          );
        } else {
          buffer.writeln(
            'required this.${visitor.fields.keys.elementAt(i)},',
          );
        }
      }
      buffer.writeln('});');
    } else {
      buffer.writeln('const $className();');
    }

    buffer.writeln('}');

    return buffer.toString();
  }
}
