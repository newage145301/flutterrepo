import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier
{
  List<Task> _tasks = [
    Task(name: 'Süt al'),
    Task(name: 'Yumurta al'),
    Task(name: 'Ekmek al'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount=> _tasks.length;

  void updateTask(Task task)
  {
    task.toggleDone();
    notifyListeners();
  }

  void addTask(task)
  {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task)
  {
    _tasks.remove(task);
    notifyListeners();
  }
}