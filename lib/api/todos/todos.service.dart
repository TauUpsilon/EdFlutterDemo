import 'package:eyr/api/api.service.dart';
import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todos.service.g.dart';
part 'todos_get/todos_get.model.dart';
part 'todos_get/todos_get.request.dart';
part 'todos_post/todos_post.model.dart';
part 'todos_post/todos_post.request.dart';

class TodosApiService with CommonFunctionable {
  ApiService get _apiService => GetIt.I<ApiService>();

  Stream<ApiModel<List<TodosGetModel>>> requestTodos() {
    final req = TodosGetRequest(
      body: {
        'test_num': '1',
        'test_str': 'test',
      },
    );

    return _apiService
        .request<List<TodosGetModel>>(
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
