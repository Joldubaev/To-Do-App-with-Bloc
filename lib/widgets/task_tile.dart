import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Tasks task;
  void _removeOrDeleteTask(BuildContext ctx, Tasks task) {
    task.isDelete!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              decoration: task.isDone! ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
          value: task.isDone,
          onChanged: task.isDelete == false
              ? (value) {
                  context.read<TasksBloc>().add(UpdateTask(task: task));
                }
              : null),
      onLongPress: () {
        _removeOrDeleteTask(context, task);
      },
    );
  }
}
