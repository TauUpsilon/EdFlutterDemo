import 'package:auto_route/auto_route.dart';
import 'package:eyr/app/app.widget.gr.dart';
import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SubNestedHomePage extends StatelessWidget with CommonFunctionable {
  SubNestedHomePage();

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
                  router.popUntilRouteWithName(
                    NestedRouter.name,
                  );
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
