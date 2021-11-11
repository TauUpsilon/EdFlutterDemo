import 'package:project/main.locator.dart';
import 'package:project/shared/models/api_data.model.dart';
import 'package:project/shared/models/data_room.model.dart';
import 'package:project/shared/models/ubike_stop.model.dart';
import 'package:project/shared/requests/ubike_stop.request.dart';
import 'package:project/shared/services/api.service.dart';

class UBikeService {
  final _apiService = locator.get<ApiService>();

  Stream<ApiData<UBikeStop>> getUBikeStops(String pageNum) {
    var uBikeStopRequest = UBikeStopGetRequest(pageNum);
    var uBikeStopCollection = new Collection<UBikeStop>();

    return this
        ._apiService
        .request<UBikeStop>(uBikeStopRequest, uBikeStopCollection);
  }
}
