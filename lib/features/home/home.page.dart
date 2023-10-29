import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_proj/app/app.widget.dart';
import 'package:flutter_proj/core/alpha_base.mixin.dart';
import 'package:flutter_proj/shares/widgets/header.widget.dart';
import 'package:rxdart/utils.dart';

part 'home.cubit.dart';
part 'home.state.dart';

@RoutePage<HomePage>()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: HomeCubit()),
        ],
        child: this,
      );
}

class HomePageState extends State<HomePage> with AppConfig {
  late HomeCubit _homeCubit;

  @override
  void didChangeDependencies() {
    _homeCubit = BlocProvider.of<HomeCubit>(context);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _homeCubit.close();

    super.dispose();
  }

  PreferredSize header() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: HeaderBarWidget(title: appTitle),
    );
  }

  Widget body() {
    return SafeArea(
      child: Center(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => _homeCubit.navigateToNetwork(context),
                  child: const Text('Network'),
                ),
                TextButton(
                  onPressed: () => _homeCubit.navigateToComponent(context),
                  child: const Text('Component'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }
}
