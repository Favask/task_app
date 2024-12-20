class BasicResponse {
  final bool? error;
  final String? message;

  BasicResponse({
    this.error,
    this.message,
  });

  factory BasicResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return BasicResponse();
    }

    return BasicResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
    };
  }

  @override
  String toString() {
    return 'BasicResponse(error: $error, message: $message)';
  }
}

//Request Model
class TaskModel {
  final String? name;
  final String? description;
  final String? deadline;

  TaskModel({
    this.name,
    this.description,
    this.deadline,
  });

  factory TaskModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return TaskModel();
    }

    return TaskModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      deadline: json['deadline'] as String

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'deadline': deadline ,
    };
  }

  @override
  String toString() {
    return 'TaskCreationModel(name: $name, description: $description, deadline: $deadline)';
  }
}