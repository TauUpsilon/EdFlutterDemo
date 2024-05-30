import 'package:eyr/api/api_service.dart';
import 'package:eyr/api/eyr_spring_boot/eyr_spring_boot_req.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api000003_req.g.dart';

@JsonSerializable()
class Api000003Req extends EYRSpringBootReq {
  @JsonKey(name: 'pk')
  String pubKey;

  Api000003Req({
    required this.pubKey,
    super.method = ApiMethod.post,
    super.uri = 'API000003',
  });

  @override
  List<Object?> get props => [pubKey];

  factory Api000003Req.fromJson(Map<String, dynamic> json) =>
      _$Api000003ReqFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$Api000003ReqToJson(this);
}
