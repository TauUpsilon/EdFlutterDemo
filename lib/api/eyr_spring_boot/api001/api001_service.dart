import 'package:eyr/api/api_service.dart';
import 'package:eyr/api/eyr_spring_boot/api001/api000001/api001001.dart';
import 'package:get_it/get_it.dart';

class Api001Service {
  final _apiService = GetIt.I<ApiService>();

  Future<ApiResponse<Api001001Res>> api001001() {
    final req = Api001001Req();

    return _apiService.request<Api001001Res>(
      req,
      _serialiseApi001001,
    );
  }

  Api001001Res _serialiseApi001001(Map<String, dynamic> res) {
    return Api001001Res.fromJson(res);
  }
}
