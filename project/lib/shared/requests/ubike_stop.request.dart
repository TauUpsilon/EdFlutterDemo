import 'package:project/shared/requests/base.request.dart';

class UBikeStopGetRequest extends BaseRequest {
  UBikeStopGetRequest(String page) {
    this.SCOPE = RequestScope.UBIKE;
    this.METHOD = RequestMethod.GET;
    this.NAME = 'uBikeStops';
    this.URI = "?${page}";
  }
}
