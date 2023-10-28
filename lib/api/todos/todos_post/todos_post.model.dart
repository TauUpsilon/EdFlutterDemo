part of '../todos.service.dart';

@JsonSerializable()
class TodosPostModel {
  @JsonKey(name: 'result')
  int result;

  TodosPostModel({
    required this.result,
  });

  factory TodosPostModel.fromJson(Map<String, dynamic> json) =>
      _$TodosPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodosPostModelToJson(this);
}
