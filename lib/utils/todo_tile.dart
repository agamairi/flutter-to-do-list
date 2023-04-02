// This file contains the model as well as the to-do tile data

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskTitle;
  final bool taskCompleted;
  //final DateTime taskDue;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  TodoTile(
      {super.key,
      required this.taskTitle,
      //required this.taskDue,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // check box
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              // task name
              Expanded(
                flex: 1,
                child: Text(
                  taskTitle,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
              //Text(taskDue.toString()),
            ],
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF7D6E0),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
