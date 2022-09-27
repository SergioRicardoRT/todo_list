import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/services/user/tasks/tasks_service.dart';

import '../../core/notifier/default_change_notifier.dart';

class TaskCreateController extends DefaultChangeNotifier {
  final TasksService _tasksService;
  DateTime? _selectedDate;

  TaskCreateController({required TasksService tasksService})
      : _tasksService = tasksService;

  set selectedDate(DateTime? selectedDate) {
    _selectedDate = selectedDate;
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;
}
