part of 'tasks_bloc.dart';

class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Tasks task;
  const AddTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class UpdateTask extends TasksEvent {
  final Tasks task;
  const UpdateTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class RemoveTask extends TasksEvent {
  final Tasks task;
  const RemoveTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Tasks task;
  const DeleteTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class MarkFavoriteOrUnfavoriteTask extends TasksEvent {
  final Tasks task;
  const MarkFavoriteOrUnfavoriteTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class EditTask extends TasksEvent {
  final Tasks oldTask;
  final Tasks newTask;
  const EditTask({
    required this.oldTask,
    required this.newTask,
  });
  @override
  List<Object> get props => [oldTask, newTask];
}
class RestoreTask extends TasksEvent {
  final Tasks task;
  const RestoreTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}
class DeleteAllTask extends TasksEvent{}