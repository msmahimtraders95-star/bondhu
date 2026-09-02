enum FriendStatus {
  pending,
  accepted,
  rejected,
  blocked,
}

class FriendModel {
  final String id;
  final String userId;
  final String friendId;
  final FriendStatus status;
  final bool isFollowing;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const FriendModel({
    required this.id,
    required this.userId,
    required this.friendId,
    this.status = FriendStatus.pending,
    this.isFollowing = false,
    this.createdAt,
    this.updatedAt,
  });

  FriendModel copyWith({
    String? id,
    String? userId,
    String? friendId,
    FriendStatus? status,
    bool? isFollowing,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FriendModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      friendId: friendId ?? this.friendId,
      status: status ?? this.status,
      isFollowing: isFollowing ?? this.isFollowing,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'friendId': friendId,
      'status': status.name,
      'isFollowing': isFollowing,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory FriendModel.fromMap(Map<String, dynamic> map) {
    return FriendModel(
      id: map['id'] as String? ?? '',
      userId: map['userId'] as String? ?? '',
      friendId: map['friendId'] as String? ?? '',
      status: _statusFromString(map['status']),
      isFollowing: map['isFollowing'] as bool? ?? false,
      createdAt: _toDateTime(map['createdAt']),
      updatedAt: _toDateTime(map['updatedAt']),
    );
  }

  static FriendStatus _statusFromString(dynamic value) {
    if (value is String) {
      switch (value) {
        case 'accepted':
          return FriendStatus.accepted;
        case 'rejected':
          return FriendStatus.rejected;
        case 'blocked':
          return FriendStatus.blocked;
        case 'pending':
        default:
          return FriendStatus.pending;
      }
    }

    return FriendStatus.pending;
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

  bool get isPending {
    return status == FriendStatus.pending;
  }

  bool get isAccepted {
    return status == FriendStatus.accepted;
  }

  bool get isRejected {
    return status == FriendStatus.rejected;
  }

  bool get isBlocked {
    return status == FriendStatus.blocked;
  }

  @override
  String toString() {
    return 'FriendModel('
        'id: $id, '
        'userId: $userId, '
        'friendId: $friendId, '
        'status: ${status.name}, '
        'isFollowing: $isFollowing'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is FriendModel &&
        other.id == id &&
        other.userId == userId &&
        other.friendId == friendId &&
        other.status == status &&
        other.isFollowing == isFollowing &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      userId,
      friendId,
      status,
      isFollowing,
      createdAt,
      updatedAt,
    );
  }
}
