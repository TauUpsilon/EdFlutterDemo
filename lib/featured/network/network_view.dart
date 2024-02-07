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
part 'network_view.g.dart';
// part 'network.state.dart';

@RouteParamGenerable()
class NetworkView extends StatelessWidget with CommonFuncable {
  NetworkView({required this.test, super.key});

  final String test;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkCubit()..requestTodos(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: HeaderBarWidget(title: AppConfig.appTitle),
        ),
        body: SafeArea(
          child: Center(
            child: BlocBuilder<NetworkCubit, void>(
              builder: (context, state) {
                // final todosModel = state.todos;

                // if (todosModel is ApiDone<List<TodosGetModel>>) {
                //   return ListView.builder(
                //     key: UniqueKey(),
                //     padding: EdgeInsets.symmetric(
                //       vertical: 30,
                //       horizontal: 20,
                //     ),
                //     itemCount: todosModel.value.length,
                //     itemBuilder: (context, index) => Card(
                //       child: ListTile(
                //         key: UniqueKey(),
                //         title: Text(todosModel.value[index].title),
                //       ),
                //     ),
                //   );
                // } else if (todosModel is ApiFail<List<TodosGetModel>>) {
                //   return Text(todosModel.message);
                // } else {
                //   return SizedBox.shrink();
                // }

                return const SizedBox.shrink();
              },
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
