class LikeModel {
  final String id;
  final String postId;
  final String userId;
  final DateTime? createdAt;

  const LikeModel({
    required this.id,
    required this.postId,
    required this.userId,
    this.createdAt,
  });

  LikeModel copyWith({
    String? id,
    String? postId,
    String? userId,
    DateTime? createdAt,
  }) {
    return LikeModel(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'postId': postId,
      'userId': userId,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  factory LikeModel.fromMap(Map<String, dynamic> map) {
    return LikeModel(
      id: map['id'] as String? ?? '',
      postId: map['postId'] as String? ?? '',
      userId: map['userId'] as String? ?? '',
      createdAt: _toDateTime(map['createdAt']),
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
    return 'LikeModel('
        'id: $id, '
        'postId: $postId, '
        'userId: $userId'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is LikeModel &&
        other.id == id &&
        other.postId == postId &&
        other.userId == userId &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      postId,
      userId,
      createdAt,
    );
  }
}
