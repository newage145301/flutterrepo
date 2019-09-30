import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'package:todoey/widgets/add_task_screen.dart';


class TasksScreen extends StatelessWidget {


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context)=>AddTask());
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, bottom: 30, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'NeYapam',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '12 Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: new TasksList(),
            ),
          )
        ],
      ),
    );
  }
}



