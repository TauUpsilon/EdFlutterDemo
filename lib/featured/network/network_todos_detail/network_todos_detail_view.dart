import 'package:equatable/equatable.dart';
import 'package:eyr/api/json_place_holder/todos/todos_get/todos_get_res.dart';
import 'package:eyr/app/app_widget.dart';
import 'package:eyr/shared/mixins/common_funcable.dart';
import 'package:eyr/shared/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_route_annotation/page_route.annotation.dart';

part 'network_todos_detail_cubit.dart';
part 'network_todos_detail_state.dart';
part 'network_todos_detail_view.g.dart';

@RouteParamGenerable()
class NetworkTodosDetailView extends StatelessWidget with CommonFuncable {
  NetworkTodosDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkTodosDetailCubit()..onInit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: HeaderBar(title: AppConfig.appTitle),
        ),
        body: SafeArea(
          child: Center(
            child:
                BlocBuilder<NetworkTodosDetailCubit, NetworkTodosDetailState>(
              builder: (context, state) => const Text('Detail'),
            ),
          ),
        ),
      ),
    );
  }
}
