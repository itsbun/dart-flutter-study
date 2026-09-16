import 'package:flutter/material.dart';

import '../models/task.dart';
import '../theme/app_colors.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/task_card.dart';

final taskList = [
  Task(
    id: '1',
    title: 'Learn Riverpod provider',
    description: 'Description for Task 1',
    priority: TaskPriority.high,
    isDone: false,
  ),
  Task(
    id: '2',
    title: 'Clone static UI',
    description: 'Description for Task 2',
    priority: TaskPriority.medium,
    isDone: true,
  ),
  Task(
    id: '3',
    title: 'Call weather API',
    description: 'Description for Task 3',
    priority: TaskPriority.medium,
    isDone: false,
  ),
  Task(
    id: '4',
    title: 'Write unit tests',
    description: 'Description for Task 4',
    priority: TaskPriority.low,
    isDone: false,
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: Text(
        'My tasks',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),

      body: ListView.builder(
        itemCount: taskList.length,

        itemBuilder: (context, index) {
          final task = taskList[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TaskCard(task: task),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
