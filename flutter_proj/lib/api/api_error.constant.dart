import 'package:flutter_proj/shared/enums/common.status.dart';

class ApiErrorConst {
  static final errorServerIssue = {
    "status": CommonStatus.fail,
    "value": null,
    "error": {
      "code": "500",
      "message": "Server Issue",
    }
  };
}
