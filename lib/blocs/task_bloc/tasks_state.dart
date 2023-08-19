part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTask;
  final List<Task> removedTask;
  const TasksState({
    this.allTask = const <Task>[],
    this.removedTask = const <Task>[],
  });

  @override
  List<Object> get props => [allTask, removedTask];

  Map<String, dynamic> toMap() {
    return {
      'allTask': allTask.map((x) => x.toMap()).toList(),
      'removedTask': removedTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTask: List<Task>.from(map['allTask']?.map((x) => Task.fromMap(x))),
      removedTask:
          List<Task>.from(map['removedTask']?.map((x) => Task.fromMap(x))),
    );
  }
}
