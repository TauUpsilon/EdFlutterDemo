import 'package:eyr/app/app_widget.dart';
import 'package:eyr/featured/common/test/test_cubit.dart';
import 'package:eyr/featured/common/test/test_state.dart';
import 'package:eyr/shared/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_paramable_annotation/json_paramable_annotation.dart';

part 'test_view.g.dart';

@JsonSerializable(
  ignoreUnannotated: true,
)
@JsonParamable()
class CommonTestView extends StatelessWidget {
  const CommonTestView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommonTestCubit()..onInit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: HeaderBar(title: AppConfig.appTitle),
        ),
        body: SafeArea(
          child: Center(
            child: BlocBuilder<CommonTestCubit, CommonTestState>(
              builder: (context, state) => const Text('NO'),
            ),
          ),
        ),
      ),
    );
  }
}
