import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/utils.dart';

part 'nested.cubit.dart';
part 'nested.state.dart';

class NestedPage extends StatelessWidget {
  NestedPage();

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
