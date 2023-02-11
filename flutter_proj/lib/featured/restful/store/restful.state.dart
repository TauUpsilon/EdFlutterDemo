import 'package:flutter_proj/api/models/mbm081018/mbm081018.model.dart';
import 'package:flutter_proj/api/api.model.dart';
import 'package:flutter_proj/shared/enums/common.status.dart';

class RestfulState {
  final ApiModel<MBM081018Model>? mbm081018model;

  RestfulState(this.mbm081018model);

  RestfulState.initialState()
      : mbm081018model = ApiModel(
          status: CommonStatus.done,
          returnCode: "",
          data: MBM081018Model(
            updateTime: 'updateTime',
            fxRate: [
              MBM081018FxRate.fromJson({
                "CCY_NAME": "",
                "CCY_CNAME": "",
                "SPOT_BUY_RATE": "",
                "SPOT_SELL_RATE": "",
                "SPOT_BUY_DIFFERENCE": "",
                "SPOT_SELL_DIFFERENCE": "",
                "CSH_BUY_LCY": "",
                "CSH_BUY_LCY_DIFFERENCE": "",
                "CSH_SELL_LCY": "",
                "CSH_SELL_LCY_DIFFERENCE": "",
                "IS_DAY30_BUY_HIGHEST": false,
                "IS_DAY7_BUY_HIGHEST": false,
                "IS_DAY30_SELL_LOWEST": false,
                "IS_DAY7_SELL_LOWEST": false
              }),
            ],
          ),
        );
}
