part of '../json_paramable_generator.dart';

class JsonParamableVisitor extends SimpleElementVisitor<void> {
  String className = '';
  String viewName = '';
  List<ParameterElement> params = [];
  List<FieldElement> fields = [];

  @override
  void visitConstructorElement(ConstructorElement element) {
    viewName = element.returnType.toString();
    className = viewName.replaceFirst(RegExp(r'(Page|View)'), 'Param');
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
