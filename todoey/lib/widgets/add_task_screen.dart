import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class AddTask extends StatelessWidget {


  final List<Task> tasks;
  Function addTask(newTask);

  AddTask({this.tasks,this.addTask});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Yeni Görev',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
              ),
              FlatButton(
                onPressed: (){tasks.add(Task(name: 'dsfsdfsdf', isDone: true));
                },
                child: Text('Ekle',
                style: TextStyle(
                  color: Colors.white
                ),),
                color: Colors.lightBlueAccent,
              )
            ],
          ),
       
      ),
    );
  }
}
