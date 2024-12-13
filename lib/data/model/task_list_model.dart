class TaskListModel {
  final int? totalTasks;
  final int? pendingTasks;
  final List<TaskItem>? data;

  TaskListModel({
    this.totalTasks,
    this.pendingTasks,
    this.data,
  });

  factory TaskListModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return TaskListModel();
    }

    return TaskListModel(
      totalTasks: json['total_tasks'] as int?,
      pendingTasks: json['pending_tasks'] as int?,
      data: json['data'] != null
          ? (json['data'] as List)
          .map((item) => TaskItem.fromJson(item))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_tasks': totalTasks,
      'pending_tasks': pendingTasks,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'TaskListModel(totalTasks: $totalTasks, pendingTasks: $pendingTasks, data: $data)';
  }
}

class TaskItem {
  final String? name;
  final String? description;
  final double? percentage;
  final String? status;

  TaskItem({
    this.name,
    this.description,
    this.percentage,
    this.status,
  });

  factory TaskItem.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return TaskItem();
    }

    return TaskItem(
      name: json['name'] as String?,
      description: json['description'] as String?,
      percentage: (json['percentage'] as num?)?.toDouble(),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'percentage': percentage,
      'status': status,
    };
  }

  @override
  String toString() {
    return 'TaskItem(name: $name, status: $status, percentage: $percentage)';
  }
}