import 'package:equatable/equatable.dart';
import 'package:eyr/api/api_service.dart';
import 'package:eyr/api/eyr_spring_boot/eyr_spring_boot_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api001001.g.dart';

@JsonSerializable()
class Api001001Req extends EYRSpringBootReq {
  Api001001Req({
    super.method = ApiMethod.post,
    super.uri = 'API001001',
  });

  @override
  List<Object?> get props => [];

  factory Api001001Req.fromJson(Map<String, dynamic> json) =>
      _$Api001001ReqFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$Api001001ReqToJson(this);
}

@JsonSerializable()
class Api001001Res with EquatableMixin {
  Api001001Res();

  @override
  List<Object?> get props => [];

  factory Api001001Res.fromJson(Map<String, dynamic> json) =>
      _$Api001001ResFromJson(json);

  Map<String, dynamic> toJson() => _$Api001001ResToJson(this);
}
