import 'package:project/shared/models/api_response.model.dart';

class AppState {
  final ApiResponse apiResponse;

  AppState({this.apiResponse});

  factory AppState.initial() => AppState(
        apiResponse: ApiResponse.initial(),
      );
}
