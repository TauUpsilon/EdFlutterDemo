import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:eyr/api/api.service.dart';
import 'package:eyr/app/app.widget.dart';
import 'package:eyr/app/app.widget.gr.dart';
import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/utils.dart';

part 'home.cubit.dart';
part 'home.state.dart';

@RoutePage<HomePage>()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeCubit()),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: HeaderBarWidget(title: AppConfig.appTitle),
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: homeCubit.navigateToNetwork,
                  child: const Text('Network'),
                ),
                TextButton(
                  onPressed: homeCubit.navigateToComponent,
                  child: const Text('Component'),
                ),
                TextButton(
                  onPressed: homeCubit.navigateToNested,
                  child: const Text('Nested'),
                ),
                TextButton(
                  onPressed: homeCubit.navigateToSubNested,
                  child: const Text('Sub Nested'),
                ),
                TextButton(
                  onPressed: homeCubit.rsaRequest,
                  child: const Text('RsaRequest'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
