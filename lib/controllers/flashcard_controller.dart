import 'dart:math';
import '../models/flashcard.dart';

class FlashcardController {
  List<Flashcard> _flashcards = [];
  Random _random = Random();

  FlashcardController(List<Flashcard> flashcards) {
    _flashcards = flashcards;
  }

  // Функция для выбора следующей карточки
  Flashcard getNextCard() {
    // Алгоритм выбора карточки
    // Карточки с более высоким рейтингом имеют больше шансов быть выбранными
    final totalWeight = _flashcards.fold(0, (int total, flashcard) => total + (flashcard.rating + 1));
    int randomWeight = _random.nextInt(totalWeight);
    int weightSum = 0;

    for (final flashcard in _flashcards) {
      weightSum += flashcard.rating + 1;
      if (randomWeight < weightSum) {
        return flashcard;
      }
    }
    return _flashcards.first;
  }

  // Функция для обработки ответа пользователя
  void updateCardRating(Flashcard card, bool knows) {
    if (knows) {
      card.decrementRating();
    } else {
      card.incrementRating();
    }
    // Можете добавить логику для сохранения обновленного рейтинга в базу данных или локальное хранилище
  }
}
