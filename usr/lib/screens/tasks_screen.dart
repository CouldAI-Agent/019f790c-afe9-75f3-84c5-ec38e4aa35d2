import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<TaskItem> _tasks = [
    TaskItem(title: 'Read English Newspaper (30 mins)'),
    TaskItem(title: 'Solve 10 Simplification questions'),
    TaskItem(title: 'Solve 2 Seating Arrangement puzzles'),
    TaskItem(title: 'Attend College Classes'),
    TaskItem(title: 'Revise College Subjects (1 hour)'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Routine (Sem 3)'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return Card(
            child: CheckboxListTile(
              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                  color: task.isCompleted ? Colors.grey : null,
                ),
              ),
              value: task.isCompleted,
              onChanged: (val) {
                setState(() {
                  task.isCompleted = val ?? false;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Reset tasks for a new day
          setState(() {
            for (var task in _tasks) {
              task.isCompleted = false;
            }
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tasks reset for a new day!')),
          );
        },
        tooltip: 'Reset Day',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class TaskItem {
  String title;
  bool isCompleted;

  TaskItem({required this.title, this.isCompleted = false});
}
