part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Tasks> pedingTask;
  final List<Tasks> completedTask;
  final List<Tasks> favoriteTask;
  final List<Tasks> removedTask;
  const TasksState({
    this.pedingTask = const <Tasks>[],
    this.completedTask = const <Tasks>[],
    this.favoriteTask = const <Tasks>[],
    this.removedTask = const <Tasks>[],
  });

  @override
  List<Object> get props => [
        pedingTask,
        completedTask,
        favoriteTask,
        removedTask,
      ];

  Map<String, dynamic> toMap() {
    return {
      'pedingTask': pedingTask.map((x) => x.toMap()).toList(),
      'completedTask': completedTask.map((x) => x.toMap()).toList(),
      'favoriteTask': favoriteTask.map((x) => x.toMap()).toList(),
      'removedTask': removedTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pedingTask:
          List<Tasks>.from(map['pedingTask']?.map((x) => Tasks.fromMap(x))),
      completedTask:
          List<Tasks>.from(map['completedTask']?.map((x) => Tasks.fromMap(x))),
      favoriteTask:
          List<Tasks>.from(map['favoriteTask']?.map((x) => Tasks.fromMap(x))),
      removedTask:
          List<Tasks>.from(map['removedTask']?.map((x) => Tasks.fromMap(x))),
    );
  }
}
