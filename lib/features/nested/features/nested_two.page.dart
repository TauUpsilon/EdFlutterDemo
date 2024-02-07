import 'package:eyr/app/app_router.dart';
import 'package:eyr/shared/mixins/common_funcable.dart';
import 'package:eyr/shared/widgets/header.widget.dart';
import 'package:flutter/material.dart';

class NestedTwoPage extends StatelessWidget with CommonFuncable {
  NestedTwoPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HeaderBarWidget(title: 'Nested Two'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Hello To Two'),
            ),
            TextButton(
              onPressed: () {
                router.popUntil('/nested');
              },
              child: Text('Go Back to'),
            ),
          ],
        ),
      ),
    );
  }
}
