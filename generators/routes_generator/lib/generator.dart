import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'annotation.dart';

class RoutesGenerator extends GeneratorForAnnotation<RouterGeneratable> {
  @override
  String? generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    // final visitor = Visitor();
    // element.visitChildren(visitor);

    final buffer = StringBuffer();

    buffer.writeln('class Test {\n');
    buffer.writeln('}');

    return null;
  }
}
