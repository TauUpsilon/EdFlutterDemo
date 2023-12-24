import 'package:eyr/features/nested/nested.page.dart';
import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NestedOnePage extends StatelessWidget with CommonFunctionable {
  final String test;

  NestedOnePage({required this.test});

  @override
  Widget build(BuildContext context) {
    final nestedCubit = context.read<NestedCubit>();

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
                'With ${context.read<NestedCubit>().state.text}',
              ),
              TextButton(
                onPressed: nestedCubit.navigateToTwo,
                child: const Text('Nested Two'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
