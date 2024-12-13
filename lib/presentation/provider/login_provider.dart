import 'package:flutter/material.dart';
import 'package:profile_app/base/navigator_key.dart';
import 'package:profile_app/data/model/login_model.dart';
import 'package:profile_app/data/repository/common_repo_impl.dart';
import 'package:profile_app/presentation/view/task_list/task_list_view.dart';


class LoginProvider extends ChangeNotifier {
  UserModel? loginResponse;
  String userName = '';
  String password = '';
  bool isShowPassword = false;
  changeShowPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  Future<void> authenticate() async {
    print('----------------userName---->${userName}');
    print('----------------password---->${password}');
    CommonRepoImpl().login(email: userName,password:  password, onSuccess: (response) {
      Navigator.push(NavigatorKey.navKey.currentContext!, MaterialPageRoute(builder: (context) => const TaskListScreen()));

      loginResponse = response;
      notifyListeners();
    }, onFailure: (e) {
      ScaffoldMessenger.of(NavigatorKey.navKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text('username or password is incorrect'),
          duration: Duration(seconds: 2),
        ),
      );
      print('e->${e.toString()}');
    });
  }
}
