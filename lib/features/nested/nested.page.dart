import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/utils.dart';

part 'nested.cubit.dart';
part 'nested.state.dart';

class NestedPage extends StatelessWidget with CommonFunctionable {
  NestedPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HeaderBarWidget(title: 'Nested Home'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => router.push('/nested/nested-one'),
                child: const Text('Nested One'),
              ),
              TextButton(
                onPressed: () => router.push('/nested/nested-two'),
                child: const Text('Nested Two'),
              ),
              TextButton(
                onPressed: () => router.push('/nested/sub-nested'),
                child: const Text('Sub Nested'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
