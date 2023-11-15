import 'dart:async';
import 'package:flutter/material.dart';
import 'views/flashcard_view.dart';
import 'models/flashcard.dart';
import 'controllers/flashcard_controller.dart';

void main() {
  runApp(SerbianFlashcardsApp());
}

class SerbianFlashcardsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serbian Flashcards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlashcardScreen(),
    );
  }
}

class FlashcardScreen extends StatefulWidget {
  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  late FlashcardController _controller;
  late Flashcard _currentCard;
  bool _showFrontSide = true;

  @override
  void initState() {
    super.initState();
    _initializeFlashcards();
  }

  void _initializeFlashcards() {
    List<Flashcard> flashcards = [
      Flashcard(serbianPhrase: 'Како си?', russianTranslation: 'Как дела?'),
      Flashcard(serbianPhrase: 'Добро', russianTranslation: 'Хорошо'),
      Flashcard(serbianPhrase: 'Лаку ноћ', russianTranslation: 'Спокойной ночи'),
      Flashcard(serbianPhrase: 'Видимо се касније', russianTranslation: 'Увидимся позже'),
      Flashcard(serbianPhrase: 'Извини', russianTranslation: 'Прости'),
      Flashcard(serbianPhrase: 'Не разумем', russianTranslation: 'Я не понимаю'),
      Flashcard(serbianPhrase: 'Можете ли поновити?', russianTranslation: 'Можете повторить?'),
      Flashcard(serbianPhrase: 'Како се каже ... на српском?', russianTranslation: 'Как сказать ... по-сербски?'),
      Flashcard(serbianPhrase: 'Где је тоалет?', russianTranslation: 'Где находится туалет?'),
      Flashcard(serbianPhrase: 'Колико кошта?', russianTranslation: 'Сколько это стоит?'),
      Flashcard(serbianPhrase: 'Помоћ', russianTranslation: 'Помощь'),
      Flashcard(serbianPhrase: 'Драго ми је', russianTranslation: 'Приятно познакомиться'),
      Flashcard(serbianPhrase: 'Видимо се сутра', russianTranslation: 'Увидимся завтра'),
      Flashcard(serbianPhrase: 'Остави ме на миру', russianTranslation: 'Оставь меня в покое'),
      Flashcard(serbianPhrase: 'Желим да наручим', russianTranslation: 'Я бы хотел заказать'),
      Flashcard(serbianPhrase: 'Да ли причате руски?', russianTranslation: 'Вы говорите по-русски?'),
      Flashcard(serbianPhrase: 'Треба ми лекар', russianTranslation: 'Мне нужен врач'),
      Flashcard(serbianPhrase: 'Могу ли добити рачун?', russianTranslation: 'Можно мне счет?'),
      Flashcard(serbianPhrase: 'Да ли имате слободну собу?', russianTranslation: 'У вас есть свободный номер?'),
      Flashcard(serbianPhrase: 'Можете ли ми помоћи?', russianTranslation: 'Можете мне помочь?'),
    ];
    _controller = FlashcardController(flashcards);
    _currentCard = _controller.getNextCard();
  }

  void _flipCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  void _nextCard(bool knows) {
    setState(() {
      _controller.updateCardRating(_currentCard, knows);
      _currentCard = _controller.getNextCard();
      _showFrontSide = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serbian Flashcards'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlashcardView(
            flashcard: _currentCard,
            isFront: _showFrontSide,
            onTap: _flipCard,
            key: UniqueKey(), // Указываем ключ для FlashcardView
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => _nextCard(false),
                child: Text('Не знаю'),
              ),
              ElevatedButton(
                onPressed: () => _nextCard(true),
                child: Text('Знаю'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
