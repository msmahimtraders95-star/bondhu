enum PostType {
  text,
  image,
  video,
}

class PostModel {
  final String id;
  final String userId;
  final String userName;
  final String? userProfileImageUrl;
  final String content;
  final PostType type;
  final String? mediaUrl;
  final String? thumbnailUrl;
  final int likesCount;
  final int commentsCount;
  final int sharesCount;
  final bool isLiked;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PostModel({
    required this.id,
    required this.userId,
    required this.userName,
    this.userProfileImageUrl,
    this.content = '',
    this.type = PostType.text,
    this.mediaUrl,
    this.thumbnailUrl,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.sharesCount = 0,
    this.isLiked = false,
    this.createdAt,
    this.updatedAt,
  });

  PostModel copyWith({
    String? id,
    String? userId,
    String? userName,
    String? userProfileImageUrl,
    String? content,
    PostType? type,
    String? mediaUrl,
    String? thumbnailUrl,
    int? likesCount,
    int? commentsCount,
    int? sharesCount,
    bool? isLiked,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PostModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userProfileImageUrl:
          userProfileImageUrl ?? this.userProfileImageUrl,
      content: content ?? this.content,
      type: type ?? this.type,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      sharesCount: sharesCount ?? this.sharesCount,
      isLiked: isLiked ?? this.isLiked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userProfileImageUrl': userProfileImageUrl,
      'content': content,
      'type': type.name,
      'mediaUrl': mediaUrl,
      'thumbnailUrl': thumbnailUrl,
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'sharesCount': sharesCount,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as String? ?? '',
      userId: map['userId'] as String? ?? '',
      userName: map['userName'] as String? ?? '',
      userProfileImageUrl:
          map['userProfileImageUrl'] as String?,
      content: map['content'] as String? ?? '',
      type: _postTypeFromString(map['type']),
      mediaUrl: map['mediaUrl'] as String?,
      thumbnailUrl: map['thumbnailUrl'] as String?,
      likesCount: _toInt(map['likesCount']),
      commentsCount: _toInt(map['commentsCount']),
      sharesCount: _toInt(map['sharesCount']),
      createdAt: _toDateTime(map['createdAt']),
      updatedAt: _toDateTime(map['updatedAt']),
    );
  }

  static PostType _postTypeFromString(dynamic value) {
    if (value is String) {
      switch (value) {
        case 'image':
          return PostType.image;
        case 'video':
          return PostType.video;
        case 'text':
        default:
          return PostType.text;
      }
    }

    return PostType.text;
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

  bool get hasMedia {
    return mediaUrl != null && mediaUrl!.isNotEmpty;
  }

  bool get isTextPost {
    return type == PostType.text;
  }

  bool get isImagePost {
    return type == PostType.image;
  }

  bool get isVideoPost {
    return type == PostType.video;
  }

  @override
  String toString() {
    return 'PostModel('
        'id: $id, '
        'userId: $userId, '
        'userName: $userName, '
        'type: ${type.name}, '
        'likesCount: $likesCount, '
        'commentsCount: $commentsCount, '
        'sharesCount: $sharesCount'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is PostModel &&
        other.id == id &&
        other.userId == userId &&
        other.userName == userName &&
        other.userProfileImageUrl == userProfileImageUrl &&
        other.content == content &&
        other.type == type &&
        other.mediaUrl == mediaUrl &&
        other.thumbnailUrl == thumbnailUrl &&
        other.likesCount == likesCount &&
        other.commentsCount == commentsCount &&
        other.sharesCount == sharesCount &&
        other.isLiked == isLiked &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      userId,
      userName,
      userProfileImageUrl,
      content,
      type,
      mediaUrl,
      thumbnailUrl,
      likesCount,
      commentsCount,
      sharesCount,
      isLiked,
      createdAt,
      updatedAt,
    );
  }
}
