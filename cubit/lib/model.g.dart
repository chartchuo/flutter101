// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    text: json['text'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'text': instance.text,
      'status': instance.status,
    };

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return Todo()
    ..tasks = (json['tasks'] as List<dynamic>)
        .map((e) => Task.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'tasks': instance.tasks,
    };
