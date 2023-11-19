import 'package:auto_route/auto_route.dart';
import 'package:eyr/api/api.service.dart';
import 'package:eyr/api/todos/todos.service.dart';
import 'package:eyr/app/app.widget.dart';
import 'package:eyr/app/app.widget.gr.dart';
import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/utils.dart';

part 'network.cubit.dart';
part 'network.state.dart';

@RoutePage<NetworkPage>()
class NetworkPage extends StatelessWidget
    with CommonFunctionable
    implements AutoRouteWrapper {
  NetworkPage({required this.test});

  final String test;

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => NetworkCubit(
              routeArgs: context.routeData.argsAs<NetworkRouteArgs>(),
            ),
          ),
        ],
        child: this,
      );

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
