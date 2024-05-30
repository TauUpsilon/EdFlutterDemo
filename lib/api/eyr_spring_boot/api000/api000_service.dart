import 'package:eyr/api/api_service.dart';
import 'package:eyr/api/eyr_spring_boot/api000/api000003/api000003_req.dart';
import 'package:eyr/api/eyr_spring_boot/api000/api000003/api000003_res.dart';
import 'package:eyr/api/eyr_spring_boot/api000/api000004/api000004_req.dart';
import 'package:eyr/api/eyr_spring_boot/api000/api000004/api000004_res.dart';
import 'package:get_it/get_it.dart';

class Api000Service {
  ApiService get _apiService => GetIt.I<ApiService>();

  Future<ApiResponse<Api000003Res>> api000003() {
    final req = Api000003Req(pubKey: 'test');

    return _apiService.request<Api000003Res>(
      req,
      _serialiseApi000003,
    );
  }

  Api000003Res _serialiseApi000003(Object res) {
    return Api000003Res.fromJson((res as Map<String, dynamic>)['payload']);
  }

  Future<ApiResponse<Api000004Res>> api000004(String data) {
    final req = Api000004Req(data: data);

    return _apiService.request<Api000004Res>(
      req,
      _serialiseApi000004,
    );
  }

  Api000004Res _serialiseApi000004(Object res) {
    return Api000004Res.fromJson((res as Map<String, dynamic>)['payload']);
  }
}
