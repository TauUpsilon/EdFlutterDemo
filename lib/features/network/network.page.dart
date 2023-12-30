import 'package:eyr/api/api.service.dart';
import 'package:eyr/api/todos/todos.service.dart';
import 'package:eyr/app/app_widget.dart';
import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:page_route_annotation/page_route.annotation.dart';
import 'package:rxdart/utils.dart';

part 'network.cubit.dart';
part 'network.page.g.dart';
part 'network.state.dart';

@RouteParamGenerable()
class NetworkPage extends StatelessWidget with CommonFunctionable {
  NetworkPage({required this.test});

  final String test;

  @override
  Widget build(BuildContext context) {
    context.read<NetworkCubit>().requestTodos();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HeaderBarWidget(title: AppConfig.appTitle),
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<NetworkCubit, NetworkState>(
            builder: (context, state) {
              final todosModel = state.todos;

              if (todosModel is ApiDone<List<TodosGetModel>>) {
                return ListView.builder(
                  key: UniqueKey(),
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),
                  itemCount: todosModel.value.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      key: UniqueKey(),
                      title: Text(todosModel.value[index].title),
                    ),
                  ),
                );
              } else if (todosModel is ApiFail<List<TodosGetModel>>) {
                return Text(todosModel.message);
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
