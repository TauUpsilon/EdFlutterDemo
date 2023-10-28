part of '../todos.service.dart';

class TodosGetRequest extends JsonPlaceholderRequest {
  TodosGetRequest()
      : super(
          reqMethod: ApiMethod.get,
          reqApi: 'todos',
          reqBody: {
            "test_num": "1",
            "test_str": 'test',
          },
        );
}
