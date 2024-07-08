import 'package:equatable/equatable.dart';
import 'package:eyr/app/app_widget.dart';
import 'package:eyr/shared/mixins/common_funcable.dart';
import 'package:eyr/shared/widgets/header_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_paramable_annotation/json_paramable_annotation.dart';

part 'network_cubit.dart';
part 'network_state.dart';
part 'network_view.g.dart';

@JsonSerializable(
  ignoreUnannotated: true,
)
@JsonParamable()
class NetworkView extends StatelessWidget with CommonFuncable {
  @JsonKey()
  final String test;

  NetworkView({
    required this.test,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkCubit()..onInit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: HeaderBar(title: AppConfig.appTitle),
        ),
        body: SafeArea(
          child: Center(
            child: BlocBuilder<NetworkCubit, NetworkState>(
              builder: (context, state) => const Text('NO'),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('test', test));
  }
}
