// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos.service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodosGetModel _$TodosGetModelFromJson(Map<String, dynamic> json) =>
    TodosGetModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$TodosGetModelToJson(TodosGetModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };

TodosPostModel _$TodosPostModelFromJson(Map<String, dynamic> json) =>
    TodosPostModel(
      result: json['result'] as int,
    );

Map<String, dynamic> _$TodosPostModelToJson(TodosPostModel instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
