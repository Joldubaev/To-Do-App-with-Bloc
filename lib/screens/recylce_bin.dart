import 'package:flutter/material.dart';
import 'package:to_do_app/screens/my_drawer.dart';
import 'package:to_do_app/widgets/task_list.dart';

import '../blocs/bloc_exports.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Recycle Bin'), actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Delete all tasks'),
                  ),
                  onTap: () => context.read<TasksBloc>().add(DeleteAllTask()),
                ),
              ],
            ),
          ]),
          drawer: const MyDrawer(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.removedTask.length} Tasks'),
                ),
              ),
              TaskLists(taskList: state.removedTask)
            ],
          ),
        );
      },
    );
  }
}
