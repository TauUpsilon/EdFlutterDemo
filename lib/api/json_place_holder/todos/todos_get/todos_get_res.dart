import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todos_get_res.g.dart';

@JsonSerializable()
class TodosGetRes with EquatableMixin {
  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'completed')
  bool completed;

  TodosGetRes({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  @override
  List<Object?> get props => [userId, id, title, completed];

  factory TodosGetRes.fromJson(Map<String, dynamic> json) =>
      _$TodosGetResFromJson(json);

  Map<String, dynamic> toJson() => _$TodosGetResToJson(this);
}
