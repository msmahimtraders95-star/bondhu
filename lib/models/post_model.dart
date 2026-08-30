class PostModel {
  final String id;
  final String userId;
  final String userName;
  final String userProfileImage;
  final String text;
  final String imageUrl;
  final int likes;
  final int comments;
  final int shares;
  final DateTime createdAt;

  const PostModel({
    required this.id,
    required this.userId,
    required this.userName,
    this.userProfileImage = '',
    this.text = '',
    this.imageUrl = '',
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userProfileImage': userProfileImage,
      'text': text,
      'imageUrl': imageUrl,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory PostModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return PostModel(
      id: map['id']?.toString() ?? '',
      userId: map['userId']?.toString() ?? '',
      userName: map['userName']?.toString() ?? '',
      userProfileImage:
          map['userProfileImage']?.toString() ?? '',
      text: map['text']?.toString() ?? '',
      imageUrl: map['imageUrl']?.toString() ?? '',
      likes: _toInt(map['likes']),
      comments: _toInt(map['comments']),
      shares: _toInt(map['shares']),
      createdAt: _toDateTime(map['createdAt']),
    );
  }

  static int _toInt(dynamic value) {
    if (value is int) {
      return value;
    }

    if (value is num) {
      return value.toInt();
    }

    return int.tryParse(value?.toString() ?? '') ?? 0;
  }

  static DateTime _toDateTime(dynamic value) {
    if (value is DateTime) {
      return value;
    }

    return DateTime.tryParse(
          value?.toString() ?? '',
        ) ??
        DateTime.now();
  }
}
