import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks.dart';
import '../widgets/task_list.dart';

class FavoritTaskScreen extends StatelessWidget {
  const FavoritTaskScreen({super.key});
  // static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Tasks> taskLists = state.favoriteTask;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text('${taskLists.length} Tasks'),
              ),
            ),
            TaskLists(taskList: taskLists)
          ],
        );
      },
    );
  }
}
