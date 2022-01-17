import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/utils/tasks_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.only(
          top: 20,
          left: 30,
          right: 30,
        ),
        child: Column(
          children: [
            const Text(
              'Add Task',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.lightBlueAccent,
                  fontSize: 30),
            ),
            TextField(
              controller: textEditingController,
              autofocus: true,
              enableInteractiveSelection: false,
              decoration: const InputDecoration(
                  fillColor: Colors.lightBlueAccent, hintText: 'Task title'),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<TasksData>(
              builder: (context, taskData, child) {
                return TextButton(
                  onPressed: () async {
                    if (textEditingController.text != '') {
                      taskData.addTask(textEditingController.text);
                      taskData.saveData();
                      textEditingController.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    color: Colors.lightBlueAccent,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Add',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
