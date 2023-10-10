import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_proj/app/app.widget.dart';
import 'package:flutter_proj/core/alpha_base.mixin.dart';
import 'package:flutter_proj/shares/widgets/header.widget.dart';
import 'package:rxdart/utils.dart';

part 'home.cubit.dart';
part 'home.state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late HomeCubit homeCubit;

  PreferredSize header() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0),
      child: HeaderBarWidget(title: AppConfig.appTitle),
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
                  onPressed: () => homeCubit.navigateToNetwork(context),
                  child: const Text('Network'),
                ),
                TextButton(
                  onPressed: () => homeCubit.navigateToComponent(context),
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
  void didChangeDependencies() {
    homeCubit = BlocProvider.of<HomeCubit>(context);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    homeCubit.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }
}
