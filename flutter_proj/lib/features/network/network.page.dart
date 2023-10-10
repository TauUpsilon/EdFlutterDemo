import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_proj/api/api.service.dart';
import 'package:flutter_proj/api/todos/todos.service.dart';
import 'package:flutter_proj/app/app.widget.dart';
import 'package:flutter_proj/core/alpha.core.dart';
import 'package:flutter_proj/shares/enums/common.enum.dart';
import 'package:flutter_proj/shares/widgets/header.widget.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/utils.dart';

part 'network.cubit.dart';
part 'network.state.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  late NetworkCubit networkCubit;

  PreferredSize header() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0),
      child: HeaderBarWidget(title: AppConfig.appTitle),
    );
  }

  Widget body(BuildContext context) {
    return SafeArea(
      child: Center(
        child: BlocBuilder<NetworkCubit, NetworkState>(
          builder: (context, state) {
            var todosStatus = state.todos.status;
            var todosValue = state.todos.value;

            switch (todosStatus) {
              case LoadingStatus.loaded:
                if (todosValue != null) {
                  return ListView.builder(
                    key: UniqueKey(),
                    itemCount: todosValue.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(todosValue.data[index].title),
                      );
                    },
                  );
                }

                // if (state.todos.error != null) {

                // }

                return const SizedBox.shrink();
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    networkCubit = BlocProvider.of<NetworkCubit>(context);
    networkCubit.requestTodos();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    networkCubit.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body(context),
    );
  }
}
