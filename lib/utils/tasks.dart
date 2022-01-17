import 'dart:convert';

class Task {
  late String title;
  bool isDone = false;
  Task({required this.title});
  toggleIsDone() => isDone = !isDone;

  Map<String, String> toJson() {
    return {'title': title};
  }

  Task.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }
}
