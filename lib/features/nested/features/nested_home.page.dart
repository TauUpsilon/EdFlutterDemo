import 'package:auto_route/auto_route.dart';

import 'package:eyr/features/nested/nested.page.dart';
import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NestedHomePage extends StatelessWidget with CommonFunctionable {
  NestedHomePage();

  @override
  Widget build(BuildContext context) {
    final nestedCubit = context.read<NestedCubit>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HeaderBarWidget(title: 'Nested Home'),
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<NestedCubit, NestedState>(
            builder: (context, state) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: nestedCubit.navigateToOne,
                  child: const Text('Nested One'),
                ),
                TextButton(
                  onPressed: nestedCubit.navigateToTwo,
                  child: const Text('Nested Two'),
                ),
                TextButton(
                  onPressed: nestedCubit.navigateToSubNested,
                  child: const Text('Sub Nested'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
