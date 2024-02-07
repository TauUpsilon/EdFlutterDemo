import 'package:eyr/api/api_service.dart';
import 'package:eyr/shared/utils/string_util.dart';

class JsonPlaceHolderExc extends ApiException {
  String? stackTrace;

  JsonPlaceHolderExc(super.status, [super.from, super.reason, this.stackTrace]);

  @override
  String toString() => StringUtil.prettyLog(
        'Error -> EzwtExc',
        {
          'Status': status,
          'From': from,
          'Reason': reason,
        },
      );
}
