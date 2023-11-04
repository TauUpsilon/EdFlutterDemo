import 'package:flutter_proj/api/api.service.dart';
import 'package:flutter_proj/core/alpha.mixin.dart';
import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todos.service.g.dart';
part 'todos_get/todos_get.model.dart';
part 'todos_get/todos_get.request.dart';
part 'todos_post/todos_post.model.dart';
part 'todos_post/todos_post.request.dart';

class TodosApiService with Alpha {
  final _apiService = GetIt.instance.get<ApiService>();

  Stream<ApiModel<List<TodosGetModel>>> requestTodos() {
    final req = TodosGetRequest();

    return _apiService
        .request(
          req,
        )
        .map(
          (res) => res.serialise<List<TodosGetModel>>(_serialiseTodos),
        );
  }

  List<TodosGetModel> _serialiseTodos(dynamic res) {
    if (res is List) {
      return res
          .map((e) => TodosGetModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return [];
    }
  }
}
