part of '../todos.service.dart';

@JsonSerializable()
class TodosGetModel {
  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'completed')
  bool completed;

  TodosGetModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodosGetModel.fromJson(Map<String, dynamic> json) =>
      _$TodosGetModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodosGetModelToJson(this);
}
