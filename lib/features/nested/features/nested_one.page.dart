import 'package:eyr/shared/mixins/common_funcable.dart';
import 'package:eyr/shared/widgets/header.widget.dart';
import 'package:flutter/material.dart';

class NestedOnePage extends StatelessWidget with CommonFuncable {
  final String test;

  NestedOnePage({required this.test});

  @override
  Widget build(BuildContext context) {
    // final nestedCubit = context.read<NestedCubit>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HeaderBarWidget(title: 'Nested One'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'With',
              ),
              TextButton(
                onPressed: () => router.push('/nested/nested-two'),
                child: const Text('Nested Two'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
