import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class Task {
  String text;
  String status;
  Task({required this.text, this.status = 'normal'});
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

@JsonSerializable()
class Todo {
  late List<Task> tasks;
  Todo({List<Task>? initTasks}) {
    this.tasks = initTasks ?? [];
  }

  Todo.from(Todo old) {
    this.tasks = old.tasks;
  }
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
