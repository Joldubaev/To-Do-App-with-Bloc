import 'package:flutter/material.dart';
import 'package:to_do_app/screens/add_task_screen.dart';
import 'package:to_do_app/screens/completed_task_screen.dart';
import 'package:to_do_app/screens/favorite_task_screen.dart';
import 'package:to_do_app/screens/my_drawer.dart';
import 'package:to_do_app/screens/peding_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const id = 'tabs_screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PedingTaskScreen(), 'title': 'Peding Tasks'},
    {'pageName': const CompletedTaskScreen(), 'title': 'Completed Tasks'},
    {'pageName': const FavoritTaskScreen(), 'title': 'Favorite Tasks'},
  ];

  var _selectedIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddTaskScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedIndex]['pageName'],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle_sharp),
            label: 'Pading Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite Task',
          ),
        ],
      ),
    );
  }
}
