import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile_app/data/model/task_list_model.dart';
import 'package:profile_app/data/repository/common_repo_impl.dart';


class TaskListProvider extends ChangeNotifier {
  bool switchValue = false;
  List<TaskItem> data=[];

  switchChange(bool val) {
  switchValue = val;
  notifyListeners();
  }

  Future<void> fetchTaskList() async {
    CommonRepoImpl().fetchTaskList(
        onSuccess: (response) {
          print("response- > ${response}");

          data=response ?? [];
          notifyListeners();
        },
        onFailure: (e) {});
  }


}
