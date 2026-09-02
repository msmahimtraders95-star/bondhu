import 'package:flutter/foundation.dart';

class ChatModel {
  final String id;
  final List<String> participantIds;
  final String? otherUserId;
  final String? otherUserName;
  final String? otherUserProfileImageUrl;
  final String lastMessage;
  final String? lastMessageSenderId;
  final DateTime? lastMessageAt;
  final int unreadCount;
  final bool isOnline;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ChatModel({
    required this.id,
    required this.participantIds,
    this.otherUserId,
    this.otherUserName,
    this.otherUserProfileImageUrl,
    this.lastMessage = '',
    this.lastMessageSenderId,
    this.lastMessageAt,
    this.unreadCount = 0,
    this.isOnline = false,
    this.createdAt,
    this.updatedAt,
  });

  ChatModel copyWith({
    String? id,
    List<String>? participantIds,
    String? otherUserId,
    String? otherUserName,
    String? otherUserProfileImageUrl,
    String? lastMessage,
    String? lastMessageSenderId,
    DateTime? lastMessageAt,
    int? unreadCount,
    bool? isOnline,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ChatModel(
      id: id ?? this.id,
      participantIds: participantIds ?? this.participantIds,
      otherUserId: otherUserId ?? this.otherUserId,
      otherUserName: otherUserName ?? this.otherUserName,
      otherUserProfileImageUrl:
          otherUserProfileImageUrl ?? this.otherUserProfileImageUrl,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageSenderId:
          lastMessageSenderId ?? this.lastMessageSenderId,
      lastMessageAt: lastMessageAt ?? this.lastMessageAt,
      unreadCount: unreadCount ?? this.unreadCount,
      isOnline: isOnline ?? this.isOnline,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'participantIds': participantIds,
      'lastMessage': lastMessage,
      'lastMessageSenderId': lastMessageSenderId,
      'lastMessageAt': lastMessageAt?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory ChatModel.fromMap(
    Map<String, dynamic> map, {
    String? currentUserId,
  }) {
    final participants = _toStringList(map['participantIds']);

    String? otherUserId;

    if (currentUserId != null) {
      for (final participantId in participants) {
        if (participantId != currentUserId) {
          otherUserId = participantId;
          break;
        }
      }
    }

    return ChatModel(
      id: map['id'] as String? ?? '',
      participantIds: participants,
      otherUserId: otherUserId,
      otherUserName: map['otherUserName'] as String?,
      otherUserProfileImageUrl:
          map['otherUserProfileImageUrl'] as String?,
      lastMessage: map['lastMessage'] as String? ?? '',
      lastMessageSenderId:
          map['lastMessageSenderId'] as String?,
      lastMessageAt: _toDateTime(map['lastMessageAt']),
      unreadCount: _toInt(map['unreadCount']),
      isOnline: map['isOnline'] as bool? ?? false,
      createdAt: _toDateTime(map['createdAt']),
      updatedAt: _toDateTime(map['updatedAt']),
    );
  }

  static List<String> _toStringList(dynamic value) {
    if (value is List) {
      return value
          .whereType<String>()
          .toList();
    }

    return <String>[];
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

  bool hasUnreadMessages() {
    return unreadCount > 0;
  }

  bool hasLastMessage() {
    return lastMessage.trim().isNotEmpty;
  }

  bool containsUser(String userId) {
    return participantIds.contains(userId);
  }

  @override
  String toString() {
    return 'ChatModel('
        'id: $id, '
        'participantIds: $participantIds, '
        'lastMessage: $lastMessage, '
        'unreadCount: $unreadCount, '
        'isOnline: $isOnline'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChatModel &&
        listEquals(other.participantIds, participantIds) &&
        other.id == id &&
        other.otherUserId == otherUserId &&
        other.otherUserName == otherUserName &&
        other.otherUserProfileImageUrl ==
            otherUserProfileImageUrl &&
        other.lastMessage == lastMessage &&
        other.lastMessageSenderId == lastMessageSenderId &&
        other.lastMessageAt == lastMessageAt &&
        other.unreadCount == unreadCount &&
        other.isOnline == isOnline &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      Object.hashAll(participantIds),
      otherUserId,
      otherUserName,
      otherUserProfileImageUrl,
      lastMessage,
      lastMessageSenderId,
      lastMessageAt,
      unreadCount,
      isOnline,
      createdAt,
      updatedAt,
    );
  }
}
