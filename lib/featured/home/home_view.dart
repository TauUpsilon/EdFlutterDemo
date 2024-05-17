import 'package:equatable/equatable.dart';
import 'package:eyr/apn/app_routes.dart';
import 'package:eyr/app/app_navigator.dart';
import 'package:eyr/app/app_widget.dart';
import 'package:eyr/shared/mixins/common_funcable.dart';
import 'package:eyr/shared/widgets/header_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:page_route_annotation/page_route.annotation.dart';

part 'home_cubit.dart';
part 'home_state.dart';
part 'home_view.g.dart';

@JsonSerializable()
class Test {
  final String subtest;

  Test({
    required this.subtest,
  });

  factory Test.fromJson(Map json) => Test(subtest: json['subtest']);
}

@RouteParamGenerable()
class HomeView extends StatelessWidget with CommonFuncable {
  final String testone;
  final Test testtwo;
  final String? testfour;
  final VoidCallback? testthree;

  const HomeView({
    required this.testone,
    required this.testtwo,
    this.testfour = 'test',
    this.testthree,
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
                  // TextButton(
                  //   onPressed: homeCubit.rsaRequest,
                  //   child: const Text('RsaRequest'),
                  // ),
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('testone', testone))
      ..add(DiagnosticsProperty<Test>('testtwo', testtwo))
      ..add(ObjectFlagProperty<VoidCallback?>.has('testthree', testthree))
      ..add(StringProperty('testfour', testfour));
  }
}
