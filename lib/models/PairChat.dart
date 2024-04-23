

class PairChat {
  final String chatId;
  final String chatName;
  final String lastMessage;
  final int lastMessageTimestamp;
  final String lastMessageDateTime;
  final int aviFg;
  final int aviBg;
  final bool hasUnreadMessage;
  final bool verified;

  const PairChat(
      this.chatId,
      this.chatName,
      this.lastMessage,
      this.lastMessageTimestamp,
      this.lastMessageDateTime,
      this.aviFg,
      this.aviBg,
      this.hasUnreadMessage,
      this.verified);
}
