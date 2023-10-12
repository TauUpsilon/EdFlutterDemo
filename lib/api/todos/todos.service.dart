import 'package:flutter_proj/api/api.service.dart';
import 'package:flutter_proj/core/alpha_base.mixin.dart';
import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todos.service.g.dart';
part 'todos_get/todos_get.model.dart';
part 'todos_get/todos_get.request.dart';
part 'todos_post/todos_post.model.dart';
part 'todos_post/todos_post.request.dart';

class TodosApiService with AlphaBase {
  final _apiService = GetIt.instance.get<ApiService>();

  Stream<ApiModel<List<TodosGetModel>>> requestTodos() {
    var req = TodosGetRequest();

    return _apiService
        .request(
          req,
        )
        .map(
          (res) => res.serialise((value) => _serialiseTodos(value)),
        );
  }

  List<TodosGetModel> _serialiseTodos(dynamic res) {
    var data = res as List<dynamic>;

    return data.map((e) => TodosGetModel.fromJson(e)).toList();
  }
}
