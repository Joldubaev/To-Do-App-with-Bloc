import 'package:flutter/material.dart';
import 'package:to_do_app/blocs/bloc_exports.dart';
import 'package:to_do_app/widgets/task_tile.dart';

import '../models/tasks.dart';

class TaskLists extends StatelessWidget {
  const TaskLists({
    super.key,
    required this.taskList,
  });

  final List<Tasks> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map(
                (task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Text\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: task.title,
                          ),
                          const TextSpan(
                            text: '\n\nDescription\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: task.description,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void add(AddTask addTask) {}
}
// Expanded(
//       child: ListView.builder(
//           // shrinkWrap: true,
//           itemCount: taskList.length,
//           itemBuilder: (context, index) {
//             var task = taskList[index];
//             return TaskTile(task: task);
//           }),
//     );