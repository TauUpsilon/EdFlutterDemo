part of '../todos.service.dart';

class TodosGetRequest extends JsonPlaceholderRequest {
  TodosGetRequest({
    super.method = ApiMethod.get,
    super.uri = 'todos',
    super.body,
  });
}
