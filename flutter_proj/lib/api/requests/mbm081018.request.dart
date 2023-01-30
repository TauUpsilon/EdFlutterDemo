import 'package:flutter_proj/core/base_api.request.dart';
import 'package:flutter_proj/api/models/mbm081018/mbm081018.model.dart';

class MBM081018RequestBody {
  String ccyName;

  MBM081018RequestBody({
    required this.ccyName,
  });

  Map<String, dynamic> toJson() => {
        "CCY_NAME": ccyName,
      };
}

class MBM081018Request extends BaseApiRequest {
  final MBM081018RequestBody reqBody;

  MBM081018Request({required this.reqBody}) {
    method = 'POST';
    header.txId = 'MBM081018';
    body = reqBody.toJson();
  }

  @override
  dynamic responseToModel<T>(Map<String, dynamic> res) {
    var body = res['BODY'];
    var model = MBM081018Model.fromJson(body);

    return model.runtimeType == T
        ? model
        : throw 'Error: model type is not equivalent to return type';
  }
}
