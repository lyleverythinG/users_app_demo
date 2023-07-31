class Users {
  final String id;
  final String name;
  final String imageUrl;

  Users({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  @override
  bool operator ==(covariant Users other) {
    if (identical(this, other)) return true;
    return id == other.id; // Compare id for uniqueness of users.
  }

  @override
  int get hashCode => id.hashCode;
}
