import 'package:auto_route/auto_route.dart';
import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SubNestedPage extends StatelessWidget with CommonFunctionable {
  SubNestedPage();

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}
