import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class Visitor extends SimpleElementVisitor<void> {
  String className = '';
  String routeName = '';

  @override
  void visitConstructorElement(ConstructorElement element) {
    className = element.type.returnType.toString().replaceFirst('*', '');
  }
}
