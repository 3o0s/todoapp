import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function() longPresss;
  final Function(bool?) checkBoxCallback;
  const TaskTile(
      {Key? key,
      required this.checkBoxCallback,
      required this.isChecked,
      required this.title,
      required this.longPresss})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPresss,
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
      subtitle: Text(
          '${DateTime.now().day} -${DateTime.now().month}-${DateTime.now().year} '),
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontWeight: FontWeight.bold,
        ),
      ),
      tileColor: Colors.black,
    );
  }
}
