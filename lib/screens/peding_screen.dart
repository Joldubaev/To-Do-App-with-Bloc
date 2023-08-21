import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks.dart';
import '../widgets/task_list.dart';

class PedingTaskScreen extends StatelessWidget {
  const PedingTaskScreen({super.key});
  // static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Tasks> taskLists = state.pedingTask;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                    '${taskLists.length} Peding | ${state.completedTask.length} Completed'),
              ),
            ),
            TaskLists(taskList: taskLists)
          ],
        );
      },
    );
  }
}
