import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api000003_res.g.dart';

@JsonSerializable()
class Api000003Res with EquatableMixin {
  @JsonKey(name: 'pk')
  String pubKey;

  Api000003Res({
    required this.pubKey,
  });

  @override
  List<Object?> get props => [pubKey];

  factory Api000003Res.fromJson(Map<String, dynamic> json) =>
      _$Api000003ResFromJson(json);

  Map<String, dynamic> toJson() => _$Api000003ResToJson(this);
}
