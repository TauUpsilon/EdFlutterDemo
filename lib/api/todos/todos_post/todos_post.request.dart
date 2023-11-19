part of '../todos.service.dart';

class TodosPostRequest extends JsonPlaceholderRequest {
  TodosPostRequest({
    super.method = ApiMethod.post,
    super.uri = 'todos',
  });
}
