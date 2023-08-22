import 'package:flutter/material.dart';
import '../models/tasks.dart';

class PopupMenu extends StatelessWidget {
  final VoidCallback cancleOrDeleteCallback;
  final VoidCallback likeOrDislike;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;
  final Tasks task;
  const PopupMenu({
    super.key,
    required this.cancleOrDeleteCallback,
    required this.likeOrDislike,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDelete == false
          ? ((context) => [
                PopupMenuItem(
                  onTap: null,
                  child: TextButton.icon(
                    onPressed: editTaskCallback,
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                ),
                PopupMenuItem(
                  onTap: likeOrDislike,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: task.isFavorite == false
                        ? const Icon(Icons.bookmark_add_outlined)
                        : const Icon(Icons.bookmark_remove),
                    label: task.isFavorite == false
                        ? const Text('Add to \nBookmark')
                        : const Text('Remove \nfrom Bookmarks'),
                  ),
                ),
                PopupMenuItem(
                    onTap: cancleOrDeleteCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                    )),
              ])
          : (context) => [
                PopupMenuItem(
                    onTap: restoreTaskCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.restore_from_trash),
                      label: const Text('Restore'),
                    )),
                PopupMenuItem(
                    onTap: cancleOrDeleteCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete forever'),
                    )),
              ],
    );
  }
}
