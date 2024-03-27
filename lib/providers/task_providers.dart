// task_provider.dart

import 'package:flutter/foundation.dart';
import '../model/task.dart';
import '../database/database_helper.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  Future<void> fetchAndSetTasks() async {
    final tasks = await DatabaseHelper.instance.getTasks();
    _tasks = tasks;
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    final newTaskId = await DatabaseHelper.instance.insertTask(task);
    final newTask = task.copyWith(id: newTaskId.toString());
    _tasks.add(newTask);
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    await DatabaseHelper.instance.updateTask(task);
    final taskIndex = _tasks.indexWhere((t) => t.id == task.id);
    if (taskIndex != -1) {
      _tasks[taskIndex] = task;
      notifyListeners();
    }
  }

  Future<void> removeTask(String id) async {
    await DatabaseHelper.instance.deleteTask(id);
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
