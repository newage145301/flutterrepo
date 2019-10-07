import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallback;
  final Function longPressTouchCallback;
  TaskTile({this.isChecked, this.taskTitle, this.checkBoxCallback,this.longPressTouchCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressTouchCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallback,

      ),
    );
  }
}

/*
(bool value) {
setState(() {
newValue = value;
});
},
*/
