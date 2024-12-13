class UserModel {
  final String? token;
  final String? image;
  final String? name;
  final String? position;
  final int? numberOfTasks;
  final double? percentage;

  UserModel({
    this.token,
    this.image,
    this.name,
    this.position,
    this.numberOfTasks,
    this.percentage,
  });

  // Factory constructor for creating an instance from a JSON map
  factory UserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return UserModel();
    }

    return UserModel(
      token: json['token'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      position: json['position'] as String?,
      numberOfTasks: json['no_of_task'] as int?,
      percentage: (json['percentage'] as num?)?.toDouble(),
    );
  }

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'image': image,
      'name': name,
      'position': position,
      'no_of_task': numberOfTasks,
      'percentage': percentage,
    };
  }


}