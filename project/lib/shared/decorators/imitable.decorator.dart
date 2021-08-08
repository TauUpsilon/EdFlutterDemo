import 'package:reflectable/reflectable.dart';

class Imitable extends Reflectable {
  const Imitable() : super(invokingCapability);
}

const imitable = Imitable();
