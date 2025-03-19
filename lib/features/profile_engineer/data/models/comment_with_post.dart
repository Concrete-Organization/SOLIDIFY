import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';

class CommentWithPost {
  final CommentModel comment;
  final PostModel post;

  CommentWithPost({required this.comment, required this.post});
}