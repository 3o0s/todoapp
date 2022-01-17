import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/utils/tasks.dart';

class TasksData with ChangeNotifier {
  List<Task> listOFTasks = [];

  get tasksCount => listOFTasks.length;

  void addTask(String title) {
    final task = Task(title: title);
    listOFTasks.add(task);
    saveData();
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleIsDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    listOFTasks.remove(task);
    saveData();
    listOFTasks.isEmpty ? clearData() : saveData();
    notifyListeners();
  }

  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        'tasksList',
        listOFTasks.map((e) {
          return e.title;
        }).toList());
  }

  clearData() async {
    await SharedPreferences.getInstance()
        .then((value) => {value.remove('tasksList')});
    notifyListeners();
  }

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> li = prefs.getStringList('tasksList') ?? [];
    if (li.isNotEmpty && listOFTasks.isEmpty) {
      for (var element in li) {
        listOFTasks.add(Task(title: element));
      }
    }
    notifyListeners();
  }
}
