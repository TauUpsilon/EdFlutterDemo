// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class PageClassVisitor extends SimpleElementVisitor<void> {
  String className = '';
  List<ParameterElement> params = [];
  List<FieldElement> fields = [];

  @override
  void visitConstructorElement(ConstructorElement element) {
    final returnType = element.returnType.toString();
    className = returnType.replaceFirst(RegExp(r'(Page|View)'), 'RouteParam');
    params = element.parameters
        .where(
          (element) => !element.isSuperFormal,
        )
        .toList();
  }

  @override
  void visitFieldElement(FieldElement element) {
    if (element.isPrivate) return;
    fields.add(element);
  }
}
