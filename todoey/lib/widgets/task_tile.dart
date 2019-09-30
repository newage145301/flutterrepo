import 'package:flutter/material.dart';
bool newValue = true;
class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {

  void checkBoxOnChange(bool value)
  {
   setState(() {
  newValue = value;
   });
  }

 @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Görev 1'),
      subtitle: Text('Bu bir görevdir. ',
      style: TextStyle(decoration:newValue? TextDecoration.lineThrough:null),),
      trailing: new TaskCheckBox(checkBoxState: newValue,checkBoxOnChange: checkBoxOnChange),
    );
  }
}

class TaskCheckBox extends StatelessWidget {

  TaskCheckBox({this.checkBoxState,this.checkBoxOnChange});

  final bool checkBoxState;
  final Function checkBoxOnChange;



  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: newValue,

      onChanged: checkBoxOnChange,
    );
  }
}
