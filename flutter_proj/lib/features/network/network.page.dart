// import 'package:flutter/material.dart';
// import 'package:flutter_proj/api/api.model.dart';
// import 'package:flutter_proj/api/models/mbm081018/mbm081018.model.dart';
// import 'package:flutter_proj/core/app_stateful.widget.dart';
// import 'package:flutter_proj/featured/restful/store/restful.action.dart';
// import 'package:flutter_proj/featured/restful/store/restful.middleware.dart';
// import 'package:flutter_proj/featured/restful/store/restful.reducer.dart';
// import 'package:flutter_proj/featured/restful/store/restful.state.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';

import 'package:flutter/material.dart';
import 'package:flutter_proj/api/todos/todos.service.dart';
import 'package:flutter_proj/app/app.widget.dart';
import 'package:flutter_proj/shares/widgets/header.widget.dart';
import 'package:get_it/get_it.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  final _todosService = GetIt.instance.get<TodosApiService>();

  PreferredSize header() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0),
      child: HeaderBarWidget(title: AppConfig.appTitle),
    );
  }

  Widget body() {
    return const SafeArea(
      child: Center(
        child: Text('Network'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _todosService.requestTodos().listen((res) => print(res));

    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }
}
