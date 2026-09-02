class CommentModel {
  final String id;
  final String postId;
  final String userId;
  final String userName;
  final String? userProfileImageUrl;
  final String text;
  final int likesCount;
  final bool isLiked;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CommentModel({
    required this.id,
    required this.postId,
    required this.userId,
    required this.userName,
    required this.text,
    this.userProfileImageUrl,
    this.likesCount = 0,
    this.isLiked = false,
    this.createdAt,
    this.updatedAt,
  });

  CommentModel copyWith({
    String? id,
    String? postId,
    String? userId,
    String? userName,
    String? userProfileImageUrl,
    String? text,
    int? likesCount,
    bool? isLiked,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CommentModel(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userProfileImageUrl:
          userProfileImageUrl ?? this.userProfileImageUrl,
      text: text ?? this.text,
      likesCount: likesCount ?? this.likesCount,
      isLiked: isLiked ?? this.isLiked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'postId': postId,
      'userId': userId,
      'userName': userName,
      'userProfileImageUrl': userProfileImageUrl,
      'text': text,
      'likesCount': likesCount,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] as String? ?? '',
      postId: map['postId'] as String? ?? '',
      userId: map['userId'] as String? ?? '',
      userName: map['userName'] as String? ?? '',
      userProfileImageUrl:
          map['userProfileImageUrl'] as String?,
      text: map['text'] as String? ?? '',
      likesCount: _toInt(map['likesCount']),
      isLiked: map['isLiked'] as bool? ?? false,
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
    return 'CommentModel('
        'id: $id, '
        'postId: $postId, '
        'userId: $userId, '
        'userName: $userName, '
        'text: $text, '
        'likesCount: $likesCount'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is CommentModel &&
        other.id == id &&
        other.postId == postId &&
        other.userId == userId &&
        other.userName == userName &&
        other.userProfileImageUrl == userProfileImageUrl &&
        other.text == text &&
        other.likesCount == likesCount &&
        other.isLiked == isLiked &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      postId,
      userId,
      userName,
      userProfileImageUrl,
      text,
      likesCount,
      isLiked,
      createdAt,
      updatedAt,
    );
  }
}
