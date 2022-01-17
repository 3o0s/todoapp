import 'package:flutter/material.dart';
import 'package:todoapp/utils/tasks_data.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/widgets/list_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(builder: (context, taskData, child) {
      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final task = taskData.listOFTasks[index];
          return TaskTile(
              checkBoxCallback: (checkBoxCallback) {
                taskData.updateTask(task);
              },
              isChecked: task.isDone,
              title: task.title,
              longPresss: () {
                taskData.deleteTask(task);
              });
        },
        itemCount: taskData.tasksCount,
      );
    });
  }
}
