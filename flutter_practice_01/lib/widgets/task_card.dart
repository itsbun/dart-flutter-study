import 'package:flutter/material.dart';

import '../extensions/string_extension.dart';

import '../theme/app_colors.dart';

import '../models/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,

      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: AppColors.borderPrimary),
        ),

        child: Padding(
          padding: const EdgeInsets.all(12),

          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: task.isDone ? AppColors.checked : AppColors.uncheck,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    Text(
                      task.isDone
                          ? 'Done'
                          : '${task.priority.toString().split('.').last.capitalize()} priority',

                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(Icons.arrow_forward, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
