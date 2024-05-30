import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api000004_res.g.dart';

@JsonSerializable()
class Api000004Res with EquatableMixin {
  @JsonKey(name: 'data')
  String data;

  Api000004Res({
    required this.data,
  });

  @override
  List<Object?> get props => [data];

  factory Api000004Res.fromJson(Map<String, dynamic> json) =>
      _$Api000004ResFromJson(json);

  Map<String, dynamic> toJson() => _$Api000004ResToJson(this);
}
