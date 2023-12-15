import 'package:auto_route/auto_route.dart';

import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NestedTwoPage extends StatelessWidget with CommonFunctionable {
  NestedTwoPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HeaderBarWidget(title: 'Nested Two'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Hello To Two'),
        ),
      ),
    );
  }
}
