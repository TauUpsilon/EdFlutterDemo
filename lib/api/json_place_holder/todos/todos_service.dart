import 'package:eyr/api/api_service.dart';
import 'package:eyr/api/json_place_holder/todos/todos_get/todos_get_req.dart';
import 'package:eyr/api/json_place_holder/todos/todos_get/todos_get_res.dart';
import 'package:get_it/get_it.dart';

class TodosService {
  ApiService get _apiService => GetIt.I<ApiService>();

  Future<ApiResponse<List<TodosGetRes>>> requestTodos() {
    final req = TodosGetReq(test: 'test');

    return _apiService.request<List<TodosGetRes>>(
      req,
      _serialiseTodos,
    );
  }

  List<TodosGetRes> _serialiseTodos(Object res) {
    if (res is List) {
      return res
          .map((e) => TodosGetRes.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return [];
    }
  }
}
