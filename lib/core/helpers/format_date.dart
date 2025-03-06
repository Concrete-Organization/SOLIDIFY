String getRelativeTime(String date) {
  try {
    final parsedDate = DateTime.parse(date).add(Duration(hours: 1));
    final localDate = parsedDate.toLocal();
    final now = DateTime.now();
    final difference = now.difference(localDate);

    if (difference.isNegative) return "Just now";
    if (difference.inMinutes < 1) return "Just now";
    if (difference.inMinutes < 60) return "${difference.inMinutes}m";
    if (difference.inHours < 24) return "${difference.inHours}h";
    if (difference.inDays < 7) return "${difference.inDays}d";
    if (difference.inDays < 30) return "${(difference.inDays / 7).floor()}w";
    if (difference.inDays < 365) return "${(difference.inDays / 30).floor()}mo";
    return "${(difference.inDays / 365).floor()}y";
  } catch (e) {
    return 'Invalid date';
  }
}
