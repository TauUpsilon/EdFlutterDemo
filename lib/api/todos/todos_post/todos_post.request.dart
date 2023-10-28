part of '../todos.service.dart';

class TodosPostRequest extends JsonPlaceholderRequest {
  TodosPostRequest()
      : super(
          reqMethod: ApiMethod.post,
          reqApi: 'todos',
        );
}
