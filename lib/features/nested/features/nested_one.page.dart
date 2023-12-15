import 'package:auto_route/auto_route.dart';
import 'package:eyr/features/nested/nested.page.dart';

import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NestedOnePage extends StatelessWidget with CommonFunctionable {
  final String test;

  NestedOnePage({required this.test});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HeaderBarWidget(title: 'Nested One'),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            'With ${context.read<NestedCubit>().state.text}',
          ),
        ),
      ),
    );
  }
}
