import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:eyr/api/eyr_spring_boot/api000/api000_service.dart';
import 'package:eyr/apn/app_routes.dart';
import 'package:eyr/app/app_widget.dart';
import 'package:eyr/featured/network/network_view.dart';
import 'package:eyr/shared/services/crypto_service.dart';
import 'package:eyr/shared/services/logging_service.dart';
import 'package:eyr/shared/widgets/header_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_paramable_annotation/json_paramable_annotation.dart';

part 'home_cubit.dart';
part 'home_state.dart';
part 'home_view.g.dart';

@JsonSerializable(
  ignoreUnannotated: true,
  explicitToJson: true,
)
@JsonParamable()
class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..onInit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: HeaderBar(title: AppConfig.appTitle),
        ),
        body: SafeArea(
          child: Center(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: context.read<HomeCubit>().onNavigateToNetwork,
                    child: const Text('Network'),
                  ),
                  TextButton(
                    onPressed: () => context.read<HomeCubit>().onTry(),
                    child: const Text('Try'),
                  ),
                  Text(state.title),
                  Text(state.body),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@JsonSerializable()
class Test {
  final String subtest;

  Test({
    required this.subtest,
  });

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);
}
