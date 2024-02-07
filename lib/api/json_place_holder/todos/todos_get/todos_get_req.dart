import 'package:eyr/api/api_service.dart';
import 'package:eyr/api/json_place_holder/json_place_holder_req.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todos_get_req.g.dart';

@JsonSerializable()
class TodosGetReq extends JsonPlaceHolderReq {
  @JsonKey(name: 'test')
  String test;

  TodosGetReq({
    required this.test,
    super.method = ApiMethod.get,
    super.uri = 'todos',
  });

  @override
  List<Object?> get props => [test];

  factory TodosGetReq.fromJson(Map<String, dynamic> json) =>
      _$TodosGetReqFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TodosGetReqToJson(this);
}
