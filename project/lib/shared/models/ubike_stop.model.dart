import 'package:project/shared/decorators/imitable.decorator.dart';

@imitable
class UBikeStop {
  /// 站點代號
  String? SNO;

  /// 中文場站名稱
  String? SNA;

  /// 場站總停車格
  String? TOT;

  /// 可借車位數
  String? SBI;

  /// 中文場站區域 (新店區)
  String? SAREA;

  /// 資料更新時間(20211103233929)
  String? MDAY;

  /// 緯度
  String? LAT;

  /// 經度
  String? LNG;

  /// 中文地址
  String? AR;

  /// 英文場站區域
  String? SAREAEN;

  /// 英文場站名稱
  String? SNAEN;

  /// 英文地址
  String? AREN;

  /// 可還空位數
  String? BEMP;

  /// 場站是否暫停營運
  String? ACT;

  UBikeStop({
    this.SNO,
    this.SNA,
    this.TOT,
    this.SBI,
    this.SAREA,
    this.MDAY,
    this.LAT,
    this.LNG,
    this.AR,
    this.SAREAEN,
    this.SNAEN,
    this.AREN,
    this.BEMP,
    this.ACT,
  });

  static fromJson(Map<String, dynamic> json) {
    return UBikeStop(
      SNO: json['sno'],
      SNA: json['sna'],
      TOT: json['tot'],
      SBI: json['sbi'],
      SAREA: json['sarea'],
      MDAY: json['mday'],
      LAT: json['lat'],
      LNG: json['lng'],
      AR: json['ar'],
      SAREAEN: json['sareaen'],
      SNAEN: json['snaen'],
      AREN: json['aren'],
      BEMP: json['bemp'],
      ACT: json['act'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sno': SNO,
      'sna': SNA,
      'tot': TOT,
      'sbi': SBI,
      'sarea': SAREA,
      'mday': MDAY,
      'lat': LAT,
      'lng': LNG,
      'ar': AR,
      'sareaen': SAREAEN,
      'snaen': SNAEN,
      'aren': AREN,
      'bemp': BEMP,
      'act': ACT,
    };
  }
}
