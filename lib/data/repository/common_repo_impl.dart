import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:profile_app/data/model/common_model.dart';
import 'package:profile_app/data/model/login_model.dart';
import 'package:profile_app/data/model/task_detail_model.dart';
import 'package:profile_app/data/model/task_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonRepoImpl {
  static const String baseUrl = "https://erpbeta.cloudocz.com";

  Future<void> login(
      {required String email, required String password, required Function(UserModel) onSuccess, required Function(Exception) onFailure}) async {
    // Base URL and endpoint
    const String endpoint = "/api/auth/login";
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Full URL
    final String url = baseUrl + endpoint;

    // Request Body
    final Map<String, String> requestBody = {
      "email": email,
      "password": password,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      // Handling of the response
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("Login Successful!");
        final UserModel loginResponse = UserModel.fromJson(jsonDecode(response.body));

        prefs.setString('token', loginResponse.token ?? '');
        onSuccess(loginResponse);
      } else {
        print("Login Failed! Status Code: ${response.statusCode}");
        onFailure(Exception('Login failed'));
      }
    } catch (e) {
      print("An error occurred: $e");
      onFailure(Exception('Login failed'));
    }
  }

  Future<void> fetchTaskList({required Function(List<TaskItem>?) onSuccess, required Function(Exception) onFailure}) async {
    const String endpoint = "/api/app/tasks";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    final url = Uri.parse(baseUrl + endpoint);
    try {
      print("url : $url");

      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        TaskListModel result = TaskListModel.fromJson(responseData);
        onSuccess(result.data);
      } else {
        print("Failed : ${response.statusCode}");
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  Future<void> fetchTaskDetails({int? id, required Function(TaskDetailData?) onSuccess, required Function(Exception) onFailure}) async {
     String endpoint = "/api/app/task-info/$id";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';

    final url = Uri.parse(baseUrl + endpoint);
    print("url- > ${url}");
    try {
      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer $token",
        },
      );
      print("response.statusCode > ${response.statusCode}");

      if (response.statusCode == 200) {
        TaskDetailResponse DetailsResponse = TaskDetailResponse.fromJson(json.decode(response.body));
        onSuccess(DetailsResponse.data);
      } else {
        throw Exception('Failed ');
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  Future<void> saveTask({required TaskModel saveDetails, required Function(BasicResponse) onSuccess, required Function(Exception) onFailure}) async {
    String endpoint = "/api/app/store-task";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    final url = Uri.parse(baseUrl + endpoint);
    print("url- > $url");
    print("data- > ${saveDetails.toMap()}");
    try {
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(saveDetails.toMap()),
      );
      print("response.statusCode : ${response.statusCode}");

      if (response.statusCode == 200) {
        BasicResponse result = BasicResponse.fromJson(json.decode(response.body));
        onSuccess(result);
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  Future<void> updateTask(
      {int? id, required TaskModel data, required Function(BasicResponse) onSuccess, required Function(Exception) onFailure}) async {
    String endpoint = "/api/app/tasks/update/$id";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    final url = Uri.parse(baseUrl + endpoint);
    print("url- > ${url}");
    try {
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data.toMap()),
      );
      print("response.statusCode > ${response.statusCode}");

      if (response.statusCode == 200) {
        print("---------------->${response.body}");
        BasicResponse carModelResponse = BasicResponse.fromJson(json.decode(response.body));
        onSuccess(carModelResponse);
      } else {
        throw Exception('Failed ');
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  Future<void> deleteTask({int? id, required Function(BasicResponse) onSuccess, required Function(Exception) onFailure}) async {
    String endpoint = "/api/app/tasks/destroy/${id}";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';

    final url = Uri.parse(baseUrl + endpoint);
    print("url- > ${url}");
    try {
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print("response.statusCode > ${response.statusCode}");

      if (response.statusCode == 200) {
        BasicResponse carVariantResponse = BasicResponse.fromJson(json.decode(response.body));
        onSuccess(carVariantResponse);
      } else {
        throw Exception('Failed ');
      }
    } catch (e) {
      print("Error : $e");
    }
  }
}
