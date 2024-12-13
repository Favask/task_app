class TaskDetailResponse {
  final bool? error;
  final String? message;
  final TaskDetailData? data;

  TaskDetailResponse({
    this.error,
    this.message,
    this.data,
  });

  factory TaskDetailResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return TaskDetailResponse();
    }

    return TaskDetailResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? TaskDetailData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class TaskDetailData {
  final int? id;
  final String? name;
  final String? status;
  final dynamic date;
  final String? description;
  final dynamic completedPercentage;
  final List<dynamic>? attachments;
  final List<ProjectRoll>? projectRolls;
  final List<ProjectActivity>? projectActivity;

  TaskDetailData({
    this.id,
    this.name,
    this.status,
    this.date,
    this.description,
    this.completedPercentage,
    this.attachments,
    this.projectRolls,
    this.projectActivity,
  });

  factory TaskDetailData.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return TaskDetailData();
    }

    return TaskDetailData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      date: json['date'],
      description: json['description'] as String?,
      completedPercentage: json['completed_percentage'],
      attachments: json['attachments'] as List<dynamic>?,
      projectRolls: json['project_rolls'] != null
          ? (json['project_rolls'] as List)
          .map((item) => ProjectRoll.fromJson(item))
          .toList()
          : null,
      projectActivity: json['project_activity'] != null
          ? (json['project_activity'] as List)
          .map((item) => ProjectActivity.fromJson(item))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'date': date,
      'description': description,
      'completed_percentage': completedPercentage,
      'attachments': attachments,
      'project_rolls': projectRolls?.map((item) => item.toJson()).toList(),
      'project_activity': projectActivity?.map((item) => item.toJson()).toList(),
    };
  }
}

class ProjectRoll {
  final int? id;
  final String? image;
  final String? name;
  final String? roll;

  ProjectRoll({
    this.id,
    this.image,
    this.name,
    this.roll,
  });

  factory ProjectRoll.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return ProjectRoll();
    }

    return ProjectRoll(
      id: json['id'] as int?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      roll: json['roll'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'roll': roll,
    };
  }
}

class ProjectActivity {
  final int? id;
  final String? image;
  final String? name;
  final String? activity;
  final String? data;

  ProjectActivity({
    this.id,
    this.image,
    this.name,
    this.activity,
    this.data,
  });

  factory ProjectActivity.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return ProjectActivity();
    }

    return ProjectActivity(
      id: json['id'] as int?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      activity: json['activity'] as String?,
      data: json['data'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'activity': activity,
      'data': data,
    };
  }
}