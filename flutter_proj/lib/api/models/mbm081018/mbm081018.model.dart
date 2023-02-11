import 'package:json_annotation/json_annotation.dart';

part 'mbm081018.model.g.dart';

@JsonSerializable(explicitToJson: true)
class MBM081018Model {
  @JsonKey(name: 'UPDATE_TIME')
  String updateTime;
  @JsonKey(name: 'FX_RATE')
  List<MBM081018FxRate> fxRate;

  MBM081018Model({
    required this.updateTime,
    required this.fxRate,
  });

  factory MBM081018Model.fromJson(Map<String, dynamic> json) => _$MBM081018ModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBM081018ModelToJson(this);
}

@JsonSerializable()
class MBM081018FxRate {
  @JsonKey(name: 'CCY_NAME')
  String ccyName;
  @JsonKey(name: 'CCY_CNAME')
  String ccyCname;
  @JsonKey(name: 'SPOT_BUY_RATE')
  String spotBuyRate;
  @JsonKey(name: 'SPOT_SELL_RATE')
  String spotSellRate;
  @JsonKey(name: 'SPOT_BUY_DIFFERENCE')
  String spotBuyDifference;
  @JsonKey(name: 'SPOT_SELL_DIFFERENCE')
  String spotSellDifference;
  @JsonKey(name: 'CSH_BUY_LCY')
  String cshBuyLcy;
  @JsonKey(name: 'CSH_BUY_LCY_DIFFERENCE')
  String cshBuyLcyDifference;
  @JsonKey(name: 'CSH_SELL_LCY')
  String cshSellLcy;
  @JsonKey(name: 'CSH_SELL_LCY_DIFFERENCE')
  String cshSellLcyDifference;
  @JsonKey(name: 'IS_DAY30_BUY_HIGHEST')
  bool isDay30BuyHighest;
  @JsonKey(name: 'IS_DAY7_BUY_HIGHEST')
  bool isDay7BuyHighest;
  @JsonKey(name: 'IS_DAY30_SELL_LOWEST')
  bool isDay30SellLowest;
  @JsonKey(name: 'IS_DAY7_SELL_LOWEST')
  bool isDay7SellLowest;

  MBM081018FxRate({
    required this.ccyName,
    required this.ccyCname,
    required this.spotBuyRate,
    required this.spotSellRate,
    required this.spotBuyDifference,
    required this.spotSellDifference,
    required this.cshBuyLcy,
    required this.cshBuyLcyDifference,
    required this.cshSellLcy,
    required this.cshSellLcyDifference,
    required this.isDay30BuyHighest,
    required this.isDay7BuyHighest,
    required this.isDay30SellLowest,
    required this.isDay7SellLowest,
  });

  factory MBM081018FxRate.fromJson(Map<String, dynamic> json) => _$MBM081018FxRateFromJson(json);

  Map<String, dynamic> toJson() => _$MBM081018FxRateToJson(this);
}
