import 'package:flutter/foundation.dart';

enum NotificationType {
  friendRequest,
  friendAccepted,
  like,
  comment,
  share,
  message,
  follow,
  system,
}

class NotificationModel {
  final String id;
  final String userId;
  final String senderId;
  final String senderName;
  final String? senderProfileImageUrl;
  final String title;
  final String message;
  final NotificationType type;
  final String? postId;
  final String? chatId;
  final bool isRead;
  final DateTime? createdAt;

  const NotificationModel({
    required this.id,
    required this.userId,
    required this.senderId,
    required this.senderName,
    required this.title,
    required this.message,
    required this.type,
    this.senderProfileImageUrl,
    this.postId,
    this.chatId,
    this.isRead = false,
    this.createdAt,
  });

  NotificationModel copyWith({
    String? id,
    String? userId,
    String? senderId,
    String? senderName,
    String? senderProfileImageUrl,
    String? title,
    String? message,
    NotificationType? type,
    String? postId,
    String? chatId,
    bool? isRead,
    DateTime? createdAt,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      senderProfileImageUrl:
          senderProfileImageUrl ?? this.senderProfileImageUrl,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      postId: postId ?? this.postId,
      chatId: chatId ?? this.chatId,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'senderId': senderId,
      'senderName': senderName,
      'senderProfileImageUrl': senderProfileImageUrl,
      'title': title,
      'message': message,
      'type': type.name,
      'postId': postId,
      'chatId': chatId,
      'isRead': isRead,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] as String? ?? '',
      userId: map['userId'] as String? ?? '',
      senderId: map['senderId'] as String? ?? '',
      senderName: map['senderName'] as String? ?? '',
      senderProfileImageUrl:
          map['senderProfileImageUrl'] as String?,
      title: map['title'] as String? ?? '',
      message: map['message'] as String? ?? '',
      type: _typeFromString(map['type']),
      postId: map['postId'] as String?,
      chatId: map['chatId'] as String?,
      isRead: map['isRead'] as bool? ?? false,
      createdAt: _toDateTime(map['createdAt']),
    );
  }

  static NotificationType _typeFromString(dynamic value) {
    if (value is String) {
      switch (value) {
        case 'friendRequest':
          return NotificationType.friendRequest;
        case 'friendAccepted':
          return NotificationType.friendAccepted;
        case 'like':
          return NotificationType.like;
        case 'comment':
          return NotificationType.comment;
        case 'share':
          return NotificationType.share;
        case 'message':
          return NotificationType.message;
        case 'follow':
          return NotificationType.follow;
        case 'system':
        default:
          return NotificationType.system;
      }
    }

    return NotificationType.system;
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
    return 'NotificationModel('
        'id: $id, '
        'userId: $userId, '
        'senderId: $senderId, '
        'title: $title, '
        'type: ${type.name}, '
        'isRead: $isRead'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is NotificationModel &&
        other.id == id &&
        other.userId == userId &&
        other.senderId == senderId &&
        other.senderName == senderName &&
        other.senderProfileImageUrl == senderProfileImageUrl &&
        other.title == title &&
        other.message == message &&
        other.type == type &&
        other.postId == postId &&
        other.chatId == chatId &&
        other.isRead == isRead &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      userId,
      senderId,
      senderName,
      senderProfileImageUrl,
      title,
      message,
      type,
      postId,
      chatId,
      isRead,
      createdAt,
    );
  }
}
