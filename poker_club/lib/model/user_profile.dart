enum UserStatus { active, inactive }

class UserProfile {
  final String id;
  final int playerId;
  final String mobile;
  final String email;
  final String username;
  final String firstName;
  final String lastName;
  final String language;
  final String? tier;
  final String currency;
  final double coins;
  final String avatar;
  final UserStatus status;
  final String referralCode;
  final String? referredBy;
  final DateTime createdAt;

  UserProfile({
    required this.id,
    required this.playerId,
    required this.mobile,
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.language,
    required this.tier,
    required this.currency,
    required this.coins,
    required this.avatar,
    required this.status,
    required this.referralCode,
    required this.referredBy,
    required this.createdAt,
  });

  String get fullName => '$firstName $lastName'.trim();

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] ?? '',
      playerId: json['playerId'],
      mobile: json['mobile'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? json['userName'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      language: json['language'] ?? '',
      tier: json['tier'],
      currency: json['currency'] ?? '',
      coins: (json['coins'] ?? 0).toDouble(),
      avatar: json['avatar'] ?? '',
      status: json['status'] == 'active'
          ? UserStatus.active
          : UserStatus.inactive,
      referralCode: json['referralCode'] ?? '',
      referredBy: json['referredBy'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        (json['createdAt'] ?? DateTime.now().millisecondsSinceEpoch).toInt(),
      ),
    );
  }

  static String getAvatarAsset(String? avatar) {
    if (avatar != null && avatar.isNotEmpty) {
      return 'assets/avatar/avtr_$avatar.svg';
    }
    return 'assets/avatar/avtr_1.svg';
  }
}
