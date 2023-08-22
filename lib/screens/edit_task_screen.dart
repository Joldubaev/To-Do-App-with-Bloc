import 'package:flutter/material.dart';
import 'package:to_do_app/models/tasks.dart';


import '../blocs/bloc_exports.dart';

class EditTaskScreen extends StatelessWidget {
  final Tasks oldTask;
  const EditTaskScreen({
    super.key,
    required this.oldTask,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController descriptionController =
        TextEditingController(text: oldTask.description);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Edit Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          TextField(
            autofocus: true,
            controller: descriptionController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              label: Text('Description'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  var editedTask = Tasks(
                      date: DateTime.now().toString(),
                      description: descriptionController.text,
                      id: oldTask.id,
                      isDone: false,
                      isFavorite: oldTask.isFavorite,
                      title: titleController.text);
                  context.read<TasksBloc>().add(
                        EditTask(oldTask: oldTask,newTask: editedTask),
                      );
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
