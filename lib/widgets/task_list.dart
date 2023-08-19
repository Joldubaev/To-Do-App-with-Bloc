import 'package:flutter/material.dart';
import 'package:to_do_app/blocs/bloc_exports.dart';
import 'package:to_do_app/widgets/task_tile.dart';

import '../models/tasks.dart';

class TaskLists extends StatelessWidget {
  const TaskLists({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          // shrinkWrap: true,
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            var task = taskList[index];
            return TaskTile(task: task);
          }),
    );
  }

  void add(AddTask addTask) {}
}

