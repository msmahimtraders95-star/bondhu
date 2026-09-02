class ChatUserModel {
  final String userId;
  final String name;
  final String? profileImageUrl;
  final bool isOnline;
  final DateTime? lastSeen;

  const ChatUserModel({
    required this.userId,
    required this.name,
    this.profileImageUrl,
    this.isOnline = false,
    this.lastSeen,
  });

  ChatUserModel copyWith({
    String? userId,
    String? name,
    String? profileImageUrl,
    bool? isOnline,
    DateTime? lastSeen,
  }) {
    return ChatUserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      isOnline: isOnline ?? this.isOnline,
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'profileImageUrl': profileImageUrl,
      'isOnline': isOnline,
      'lastSeen': lastSeen?.toIso8601String(),
    };
  }

  factory ChatUserModel.fromMap(Map<String, dynamic> map) {
    return ChatUserModel(
      userId: map['userId'] as String? ?? '',
      name: map['name'] as String? ?? '',
      profileImageUrl: map['profileImageUrl'] as String?,
      isOnline: map['isOnline'] as bool? ?? false,
      lastSeen: _toDateTime(map['lastSeen']),
    );
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
    return 'ChatUserModel('
        'userId: $userId, '
        'name: $name, '
        'isOnline: $isOnline'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChatUserModel &&
        other.userId == userId &&
        other.name == name &&
        other.profileImageUrl == profileImageUrl &&
        other.isOnline == isOnline &&
        other.lastSeen == lastSeen;
  }

  @override
  int get hashCode {
    return Object.hash(
      userId,
      name,
      profileImageUrl,
      isOnline,
      lastSeen,
    );
  }
}
