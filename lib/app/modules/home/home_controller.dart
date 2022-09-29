import 'package:todo_list_provider/app/models/task_filter_enum.dart';

import '../../core/notifier/default_change_notifier.dart';

class HomeController extends DefaultChangeNotifier {
  final TaskFilterEnum filterSelected = TaskFilterEnum.today;
}
