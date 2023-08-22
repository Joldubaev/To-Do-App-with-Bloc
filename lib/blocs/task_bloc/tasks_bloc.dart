import 'package:equatable/equatable.dart';
import 'package:to_do_app/blocs/bloc_exports.dart';
import 'package:to_do_app/models/tasks.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
    on<MarkFavoriteOrUnfavoriteTask>(_onMarkFavoriteOrUnfavoriteTask);
    on<EditTask>(_onEditTask);
    on<RestoreTask>(_onRestoreTask);
    on<DeleteAllTask>(_onDeleteAllTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        pedingTask: List.from(state.pedingTask)..add(event.task),
        completedTask: state.completedTask,
        favoriteTask: state.favoriteTask,
        removedTask: state.removedTask,
      ),
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Tasks> pedingTask = state.pedingTask;
    List<Tasks> completedTask = state.completedTask;
    task.isDone == false
        ? {
            pedingTask = List.from(pedingTask)..remove(task),
            completedTask = List.from(completedTask)
              ..insert(
                0,
                task.copyWith(isDone: true),
              ),
          }
        : {
            completedTask = List.from(completedTask)..remove(task),
            pedingTask = List.from(pedingTask)
              ..insert(0, task.copyWith(isDone: false))
          };

    emit(TasksState(
      pedingTask: pedingTask,
      completedTask: completedTask,
      favoriteTask: state.favoriteTask,
      removedTask: state.removedTask,
    ));
  }
  //  List<Tasks> pedingTask = state.pedingTask;
  // List<Tasks> completedTask = state.completedTask;
  // List<Tasks> favoriteTask = state.favoriteTask;
  // if (task.isDone == false) {
  //   if (task.isFavorite == false) {
  //     pedingTask = List.from(pedingTask)..remove(task);
  //     completedTask.insert(0, task.copyWith(isDone: true));
  //   } else {
  //     var taskIndex = favoriteTask.indexOf(task);
  //     pedingTask = List.from(pedingTask)..remove(task);
  //     completedTask.insert(0, task.copyWith(isDone: true));
  //     favoriteTask = List.from(favoriteTask)
  //       ..remove(task)
  //       ..insert(taskIndex, task.copyWith(isDone: true));
  //   }
  // } else {
  //   if (task.isFavorite == false) {
  //     completedTask = List.from(completedTask)..remove(task);
  //     pedingTask = List.from(pedingTask)
  //       ..insert(0, task.copyWith(isDone: true));
  //   } else {
  //     var taskIndex = favoriteTask.indexOf(task);
  //     completedTask = List.from(completedTask)..remove(task);
  //     pedingTask = List.from(pedingTask)
  //       ..insert(0, task.copyWith(isDone: false));
  //     favoriteTask = List.from(favoriteTask)
  //       ..remove(task)
  //       ..insert(taskIndex, task.copyWith(isDone: false));
  //   }
  // }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        pedingTask: state.pedingTask,
        completedTask: state.completedTask,
        favoriteTask: state.favoriteTask,
        removedTask: List.from(state.removedTask)..remove(event.task),
      ),
    );
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
          pedingTask: List.from(state.pedingTask)..remove(event.task),
          completedTask: List.from(state.completedTask)..remove(event.task),
          favoriteTask: List.from(state.favoriteTask)..remove(event.task),
          removedTask: List.from(state.removedTask)
            ..add(event.task.copyWith(isDelete: true))),
    );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }

  void _onMarkFavoriteOrUnfavoriteTask(
      MarkFavoriteOrUnfavoriteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Tasks> pedingTask = state.pedingTask;
    List<Tasks> completedTask = state.completedTask;
    List<Tasks> favoriteTask = state.favoriteTask;

    if (event.task.isDone == false) {
      if (event.task.isFavorite == false) {
        var taskIndex = pedingTask.indexOf(event.task);
        pedingTask = List.from(pedingTask)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTask.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = pedingTask.indexOf(event.task);
        pedingTask = List.from(pedingTask)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTask.remove(event.task);
      }
    } else {
      if (event.task.isFavorite == false) {
        var taskIndex = completedTask.indexOf(event.task);
        completedTask = List.from(completedTask)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTask.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = completedTask.indexOf(event.task);
        completedTask = List.from(completedTask)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTask.remove(event.task);
      }
    }
    emit(TasksState(
      pedingTask: pedingTask,
      completedTask: completedTask,
      favoriteTask: favoriteTask,
      removedTask: state.removedTask,
    ));
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Tasks> favoriteTask = state.favoriteTask;
    if (event.oldTask.isFavorite == true) {
      favoriteTask
        ..remove(event.oldTask)
        ..insert(0, event.newTask);
    }
    emit(TasksState(
      pedingTask: List.from(state.pedingTask)
        ..remove(event.oldTask)
        ..insert(0, event.newTask),
      completedTask: state.completedTask..remove(event.oldTask),
      favoriteTask: favoriteTask,
      removedTask: state.removedTask,
    ));
  }

  void _onRestoreTask(RestoreTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
        removedTask: List.from(state.removedTask)..remove(event.task),
        pedingTask: List.from(state.pedingTask)
          ..insert(
              0,
              event.task.copyWith(
                isDelete: false,
                isDone: false,
                isFavorite: false,
              )),
        completedTask: state.completedTask,
        favoriteTask: state.favoriteTask));
  }

  void _onDeleteAllTask(DeleteAllTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
        removedTask: List.from(state.removedTask)..clear(),
        pedingTask: state.pedingTask,
        completedTask: state.completedTask,
        favoriteTask: state.favoriteTask));
  }
}
