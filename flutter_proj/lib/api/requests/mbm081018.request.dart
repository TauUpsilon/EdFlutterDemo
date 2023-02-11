import 'package:flutter_proj/api/api.request.dart';

class MBM081018RequestBody {
  String ccyName;

  MBM081018RequestBody({
    required this.ccyName,
  });

  Map<String, dynamic> toJson() => {
        "CCY_NAME": ccyName,
      };
}

class MBM081018Request extends ApiRequest {
  final MBM081018RequestBody reqBody;

  MBM081018Request({required this.reqBody}) {
    method = 'POST';
    header.txId = 'MBM081018';
    body = reqBody.toJson();
  }
}
