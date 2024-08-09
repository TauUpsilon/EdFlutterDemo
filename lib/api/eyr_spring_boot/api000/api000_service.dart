import 'package:eyr/api/api_service.dart';
import 'package:eyr/api/eyr_spring_boot/api000/api000003/api000003.dart';
import 'package:eyr/api/eyr_spring_boot/api000/api000004/api000004.dart';
import 'package:get_it/get_it.dart';

class Api000Service {
  final _apiService = GetIt.I<ApiService>();

  Future<ApiResponse<Api000003Res>> api000003() {
    final req = Api000003Req();

    return _apiService.request<Api000003Res>(
      req,
      _serialiseApi000003,
    );
  }

  Api000003Res _serialiseApi000003(Map<String, dynamic> res) {
    return Api000003Res.fromJson(res);
  }

  Future<ApiResponse<Api000004Res>> api000004(String data) {
    final req = Api000004Req(data: data);

    return _apiService.request<Api000004Res>(
      req,
      _serialiseApi000004,
    );
  }

  Api000004Res _serialiseApi000004(Map<String, dynamic> res) {
    return Api000004Res.fromJson(res);
  }
}
