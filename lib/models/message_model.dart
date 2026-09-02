enum MessageType {
  text,
  image,
  video,
  file,
}

class MessageModel {
  final String id;
  final String chatId;
  final String senderId;
  final String receiverId;
  final String text;
  final MessageType type;
  final String? mediaUrl;
  final bool isRead;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const MessageModel({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.receiverId,
    this.text = '',
    this.type = MessageType.text,
    this.mediaUrl,
    this.isRead = false,
    this.createdAt,
    this.updatedAt,
  });

  MessageModel copyWith({
    String? id,
    String? chatId,
    String? senderId,
    String? receiverId,
    String? text,
    MessageType? type,
    String? mediaUrl,
    bool? isRead,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MessageModel(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      text: text ?? this.text,
      type: type ?? this.type,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chatId': chatId,
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'type': type.name,
      'mediaUrl': mediaUrl,
      'isRead': isRead,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String? ?? '',
      chatId: map['chatId'] as String? ?? '',
      senderId: map['senderId'] as String? ?? '',
      receiverId: map['receiverId'] as String? ?? '',
      text: map['text'] as String? ?? '',
      type: _typeFromString(map['type']),
      mediaUrl: map['mediaUrl'] as String?,
      isRead: map['isRead'] as bool? ?? false,
      createdAt: _toDateTime(map['createdAt']),
      updatedAt: _toDateTime(map['updatedAt']),
    );
  }

  static MessageType _typeFromString(dynamic value) {
    if (value is String) {
      switch (value) {
        case 'image':
          return MessageType.image;
        case 'video':
          return MessageType.video;
        case 'file':
          return MessageType.file;
        case 'text':
        default:
          return MessageType.text;
      }
    }

    return MessageType.text;
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

  bool get isTextMessage {
    return type == MessageType.text;
  }

  bool get isImageMessage {
    return type == MessageType.image;
  }

  bool get isVideoMessage {
    return type == MessageType.video;
  }

  bool get isFileMessage {
    return type == MessageType.file;
  }

  bool get hasMedia {
    return mediaUrl != null && mediaUrl!.isNotEmpty;
  }

  @override
  String toString() {
    return 'MessageModel('
        'id: $id, '
        'chatId: $chatId, '
        'senderId: $senderId, '
        'receiverId: $receiverId, '
        'type: ${type.name}, '
        'isRead: $isRead'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is MessageModel &&
        other.id == id &&
        other.chatId == chatId &&
        other.senderId == senderId &&
        other.receiverId == receiverId &&
        other.text == text &&
        other.type == type &&
        other.mediaUrl == mediaUrl &&
        other.isRead == isRead &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      chatId,
      senderId,
      receiverId,
      text,
      type,
      mediaUrl,
      isRead,
      createdAt,
      updatedAt,
    );
  }
}
