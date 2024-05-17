import 'package:equatable/equatable.dart';
import 'package:eyr/api/json_place_holder/todos/todos_get/todos_get_res.dart';
import 'package:eyr/api/json_place_holder/todos/todos_service.dart';
import 'package:eyr/app/app_widget.dart';
import 'package:eyr/shared/mixins/common_funcable.dart';
import 'package:eyr/shared/widgets/header_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:page_route_annotation/page_route.annotation.dart';

part 'network_cubit.dart';
part 'network_state.dart';
part 'network_view.g.dart';

@RouteParamGenerable()
class NetworkView extends StatelessWidget with CommonFuncable {
  NetworkView({required this.test, super.key});

  final String test;

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
              builder: (context, state) => ListView.builder(
                key: UniqueKey(),
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                itemCount: state.todos.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    key: UniqueKey(),
                    title: Text(state.todos[index].title),
                  ),
                ),
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
    properties.add(StringProperty('test', test));
  }
}
