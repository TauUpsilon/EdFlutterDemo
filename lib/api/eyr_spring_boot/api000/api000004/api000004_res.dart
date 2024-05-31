import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api000004_res.g.dart';

@JsonSerializable()
class Api000004Res with EquatableMixin {
  @JsonKey(name: 'encryptedData')
  String encryptedData;

  @JsonKey(name: 'decryptedData')
  String decryptedData;

  Api000004Res({
    required this.encryptedData,
    required this.decryptedData,
  });

  @override
  List<Object?> get props => [encryptedData, decryptedData];

  factory Api000004Res.fromJson(Map<String, dynamic> json) =>
      _$Api000004ResFromJson(json);

  Map<String, dynamic> toJson() => _$Api000004ResToJson(this);
}
