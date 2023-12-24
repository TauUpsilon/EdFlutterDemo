import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';

class SubNestedPage extends StatelessWidget with CommonFunctionable {
  SubNestedPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HeaderBarWidget(title: 'Sub Nested Home'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello from sub home'),
              TextButton(
                onPressed: () {
                  // router.popUntilRouteWithName(
                  //   NestedHomeRoute.name,
                  //   scoped: false,
                  // );
                },
                child: Text(
                  'Go Back to',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
