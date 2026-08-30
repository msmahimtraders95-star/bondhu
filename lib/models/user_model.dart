class UserModel {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final String bio;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage = '',
    this.bio = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'bio': bio,
    };
  }

  factory UserModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return UserModel(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      email: map['email']?.toString() ?? '',
      profileImage:
          map['profileImage']?.toString() ?? '',
      bio: map['bio']?.toString() ?? '',
    );
  }
}
