import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile_app/data/model/common_model.dart';
import 'package:profile_app/data/model/task_detail_model.dart';
import 'package:profile_app/data/repository/common_repo_impl.dart';

class TaskDetailProvider extends ChangeNotifier {
  TaskDetailData? data;
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController descriptionController = TextEditingController(text: "");
  TextEditingController deadLineController = TextEditingController(text: "");

  changeValue(bool val) {
    notifyListeners();
  }

  Future<void> fetchTaskDetail({int? id}) async {
    CommonRepoImpl().fetchTaskDetails(
        id: id,
        onSuccess: (response) {
          print("response- > ${response}");

          data = response;
          notifyListeners();
        },
        onFailure: (e) {});
  }

  Future<void> saveTaskDetail({int? id}) async {
    CommonRepoImpl().updateTask(
        id: id,
        data: TaskModel(name: nameController.text, description: descriptionController.text, deadline: deadLineController.text),
        onSuccess: (response) {
          print("response- > ${response}");

          notifyListeners();
        },
        onFailure: (e) {});
  }

  Future<void> deleteTask({int? id}) async {
    CommonRepoImpl().deleteTask(
        id: id,
        onSuccess: (response) {
          print("response- > ${response}");

          notifyListeners();
        },
        onFailure: (e) {});
  }
}
