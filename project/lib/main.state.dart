import 'package:project/main.model.dart';

class AppState<T> {
  final ApiResponse<T> apiResponse;

  AppState({this.apiResponse});

  factory AppState.initial() => AppState(
        apiResponse: ApiResponse.initial(),
      );
}
