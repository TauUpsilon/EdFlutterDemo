import 'package:eyr/api/api_service.dart';
import 'package:eyr/api/eyr_spring_boot/eyr_spring_boot_req.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api000004_req.g.dart';

@JsonSerializable()
class Api000004Req extends EYRSpringBootReq {
  @JsonKey(name: 'data')
  String data;

  Api000004Req({
    required this.data,
    super.method = ApiMethod.post,
    super.uri = 'API000004',
  });

  @override
  List<Object?> get props => [data];

  factory Api000004Req.fromJson(Map<String, dynamic> json) =>
      _$Api000004ReqFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$Api000004ReqToJson(this);
}
