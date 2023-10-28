import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:routes_generator/annotation.dart';
import 'package:source_gen/source_gen.dart';

class RoutesGenerator extends GeneratorForAnnotation<RouterGeneratable> {
  @override
  String? generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    // final visitor = Visitor();
    // element.visitChildren(visitor);

    // final buffer = StringBuffer()
    //   ..writeln('class Test {\n')
    //   ..writeln('}');

    return null;
  }
}
