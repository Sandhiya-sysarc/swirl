import 'dart:convert';

import 'package:flutter/foundation.dart';

/*
  @author     :   karthick.d  13/10/2025
  @desc       :   object for job information , the job is a collection of tasks
                  data is a dataprovider for running task
                  example : if checkpage task is running then the task will look
                  up pageurl property in dataprovider 
                  similarly if checkFormData task is running then 
*/

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/bloc/bpwidgetaction/model/tasks/bpwidget_task.dart';
import 'package:dashboard/bloc/bpwidgetaction/model/dataprovider/bpwidget_tasks_dataprovider.dart';

class BPwidgetJob {
  String type;
  String id;
  String name;
  BPTaskDataprovider taskDataprovider;
  List<BPwidgetTask> tasks;
  BPwidgetJob({
    required this.type,
    required this.id,
    required this.name,
    required this.taskDataprovider,
    required this.tasks,
  });

  @override
  String toString() {
    return 'BPwidgetJob(type: $type, id: $id, name: $name, taskDataprovider: $taskDataprovider, tasks: $tasks)';
  }

  BPwidgetJob copyWith({
    String? type,
    String? id,
    String? name,
    BPTaskDataprovider? taskDataprovider,
    List<BPwidgetTask>? tasks,
  }) {
    return BPwidgetJob(
      type: type ?? this.type,
      id: id ?? this.id,
      name: name ?? this.name,
      taskDataprovider: taskDataprovider ?? this.taskDataprovider,
      tasks: tasks ?? this.tasks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'id': id,
      'name': name,
      'taskDataprovider': taskDataprovider.toMap(),
      'tasks': tasks.map((x) => x.toMap()).toList(),
    };
  }

  factory BPwidgetJob.fromMap(Map<String, dynamic> map) {
    return BPwidgetJob(
      type: map['type'] as String,
      id: map['id'] as String,
      name: map['name'] as String,
      taskDataprovider: BPTaskDataprovider.fromMap(
        map['taskDataprovider'] as Map<String, dynamic>,
      ),
      tasks: List<BPwidgetTask>.from(
        (map['tasks'] as List<dynamic>).map<dynamic>(
          (x) => BPwidgetTask.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BPwidgetJob.fromJson(String source) =>
      BPwidgetJob.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant BPwidgetJob other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.id == id &&
        other.name == name &&
        other.taskDataprovider == taskDataprovider &&
        listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode {
    return type.hashCode ^
        id.hashCode ^
        name.hashCode ^
        taskDataprovider.hashCode ^
        tasks.hashCode;
  }
}
