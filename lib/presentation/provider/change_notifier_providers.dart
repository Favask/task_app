
import 'package:profile_app/presentation/provider/task/task_detail_provider.dart';
import 'package:profile_app/presentation/provider/task/task_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'login_provider.dart';

class ChangeNotifierProviders {
  static final List<SingleChildWidget> list = [
    ChangeNotifierProvider(create: (context) => LoginProvider()),
    ChangeNotifierProvider(create: (context) => TaskListProvider()),
    ChangeNotifierProvider(create: (context) => TaskDetailProvider()),
  ];
}
