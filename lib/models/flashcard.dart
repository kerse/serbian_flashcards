class Flashcard {
  String serbianPhrase;
  String russianTranslation;
  int rating;

  Flashcard({required this.serbianPhrase, required this.russianTranslation, this.rating = 0});

  void incrementRating() {
    rating++;
  }

  void decrementRating() {
    if (rating > 0) {
      rating--;
    }
  }
}
