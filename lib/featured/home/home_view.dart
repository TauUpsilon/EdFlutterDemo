import 'package:equatable/equatable.dart';
import 'package:eyr/app/app_widget.dart';
import 'package:eyr/apr/app_routes.dart';
import 'package:eyr/shared/mixins/common_funcable.dart';
import 'package:eyr/shared/widgets/header_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_route_annotation/page_route.annotation.dart';

part 'home_cubit.dart';
part 'home_state.dart';
part 'home_view.g.dart';

@RouteParamGenerable()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..onInit(),
      child: Scaffold(
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
                    onPressed: context.read<HomeCubit>().navigateToNetwork,
                    child: const Text('Network'),
                  ),
                  TextButton(
                    onPressed: context.read<HomeCubit>().navigateToTry,
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
}
