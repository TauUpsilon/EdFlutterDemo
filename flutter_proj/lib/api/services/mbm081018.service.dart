import 'package:flutter_proj/core/base_api.service.dart';
import 'package:flutter_proj/api/models/mbm081018/mbm081018.model.dart';
import 'package:flutter_proj/api/requests/mbm081018.request.dart';

class MBM081018Service extends BaseApiService {
  Future<MBM081018Model> getFxRate(String ccyName) {
    var req = MBM081018Request(
      reqBody: MBM081018RequestBody(
        ccyName: ccyName,
      ),
    );

    return request<MBM081018Model>(req);
  }
}
