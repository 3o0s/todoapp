import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/screens/add_task_screen.dart';
import 'package:todoapp/utils/constants.dart';
import 'package:todoapp/utils/tasks_data.dart';
import 'package:todoapp/widgets/tasks_list.dart';
  DateTime date = DateTime.now();

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<TasksData>(context).loadData();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: const Icon(
              Icons.add,
              size: 50,
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                          child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: const AddTaskScreen(),
                      )));
            }),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.lightBlueAccent,
              width: double.infinity,
              padding: kBottomContainerPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...kupperBar,
                  Text(
                    'Remaining Tasts: ${Provider.of<TasksData>(context).listOFTasks.length}',
                    style: kTextStyle,
                  ),Text(
    '${monthsList[date.month]} -${date.day} ',
    style:kDateFormat,
  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                decoration: kTasksContainerDecoration,
                child: const TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
