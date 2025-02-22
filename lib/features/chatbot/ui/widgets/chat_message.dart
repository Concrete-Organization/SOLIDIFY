class ChatMessage {
  final String text;
  final bool isUser; // true if it's the user's message, false if it's the bot's

  ChatMessage({required this.text, required this.isUser});
}
