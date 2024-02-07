import 'package:eyr/app/app_widget.dart';
import 'package:eyr/shared/mixins/common_funcable.dart';
import 'package:eyr/shared/widgets/header.widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_route_annotation/page_route.annotation.dart';

part 'home.cubit.dart';
part 'home.page.g.dart';
part 'home.state.dart';

@RouteParamGenerable()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>()..onInit();

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
                Text(state.title),
                Text(state.body),
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
                // TextButton(
                //   onPressed: homeCubit.rsaRequest,
                //   child: const Text('RsaRequest'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
