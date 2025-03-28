import 'user.dart';

class Review {
  final User user;
  final String comment;
  final int rating; 

  Review({required this.user, required this.comment, required this.rating}) {
    if (rating < 1 || rating > 5) {
      throw ArgumentError("Rating must be between 1 and 5.");
    }
  }

  void showReview() {
    print("⭐ Review by ${user.name}: \"$comment\" (Rating: $rating/5)");
  }
}
