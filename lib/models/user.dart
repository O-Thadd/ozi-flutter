class User {

  final String userId;
  final String username;
  final int aviFg;
  final int aviBg;
  final bool online;
  final bool verified;
  final String gameState;

  const User({
    required this.userId,
    required this.username,
    required this.aviFg,
    required this.aviBg,
    required this.online,
    required this.verified,
    required this.gameState,
  });

}