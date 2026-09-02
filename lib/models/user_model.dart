class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? profileImageUrl;
  final String? coverImageUrl;
  final String? bio;
  final String? location;
  final String? website;
  final int friendsCount;
  final int followersCount;
  final int followingCount;
  final bool isOnline;
  final DateTime? lastSeen;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.profileImageUrl,
    this.coverImageUrl,
    this.bio,
    this.location,
    this.website,
    this.friendsCount = 0,
    this.followersCount = 0,
    this.followingCount = 0,
    this.isOnline = false,
    this.lastSeen,
    this.createdAt,
    this.updatedAt,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? profileImageUrl,
    String? coverImageUrl,
    String? bio,
    String? location,
    String? website,
    int? friendsCount,
    int? followersCount,
    int? followingCount,
    bool? isOnline,
    DateTime? lastSeen,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      website: website ?? this.website,
      friendsCount: friendsCount ?? this.friendsCount,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
      isOnline: isOnline ?? this.isOnline,
      lastSeen: lastSeen ?? this.lastSeen,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
      'coverImageUrl': coverImageUrl,
      'bio': bio,
      'location': location,
      'website': website,
      'friendsCount': friendsCount,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'isOnline': isOnline,
      'lastSeen': lastSeen?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      email: map['email'] as String? ?? '',
      phone: map['phone'] as String?,
      profileImageUrl: map['profileImageUrl'] as String?,
      coverImageUrl: map['coverImageUrl'] as String?,
      bio: map['bio'] as String?,
      location: map['location'] as String?,
      website: map['website'] as String?,
      friendsCount: _toInt(map['friendsCount']),
      followersCount: _toInt(map['followersCount']),
      followingCount: _toInt(map['followingCount']),
      isOnline: map['isOnline'] as bool? ?? false,
      lastSeen: _toDateTime(map['lastSeen']),
      createdAt: _toDateTime(map['createdAt']),
      updatedAt: _toDateTime(map['updatedAt']),
    );
  }

  static int _toInt(dynamic value) {
    if (value is int) {
      return value;
    }

    if (value is num) {
      return value.toInt();
    }

    return 0;
  }

  static DateTime? _toDateTime(dynamic value) {
    if (value is DateTime) {
      return value;
    }

    if (value is String) {
      return DateTime.tryParse(value);
    }

    return null;
  }

  @override
  String toString() {
    return 'UserModel('
        'id: $id, '
        'name: $name, '
        'email: $email, '
        'phone: $phone, '
        'friendsCount: $friendsCount, '
        'followersCount: $followersCount, '
        'followingCount: $followingCount, '
        'isOnline: $isOnline'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.profileImageUrl == profileImageUrl &&
        other.coverImageUrl == coverImageUrl &&
        other.bio == bio &&
        other.location == location &&
        other.website == website &&
        other.friendsCount == friendsCount &&
        other.followersCount == followersCount &&
        other.followingCount == followingCount &&
        other.isOnline == isOnline &&
        other.lastSeen == lastSeen &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      email,
      phone,
      profileImageUrl,
      coverImageUrl,
      bio,
      location,
      website,
      friendsCount,
      followersCount,
      followingCount,
      isOnline,
      lastSeen,
      createdAt,
      updatedAt,
    );
  }
}
