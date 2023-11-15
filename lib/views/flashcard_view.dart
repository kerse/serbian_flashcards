import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class FlashcardView extends StatelessWidget {
  final Flashcard flashcard;
  final bool isFront;
  final VoidCallback onTap;
  final Key key;

  const FlashcardView({
    required this.key,
    required this.flashcard,
    required this.isFront,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Виджет для отображения содержимого карточки
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                isFront ? flashcard.serbianPhrase : flashcard.russianTranslation,
                style: TextStyle(fontSize: 20.0, color: isFront ? Colors.black : Colors.blue),
              ),
              if (!isFront)
                Text(
                  'Рейтинг: ${flashcard.rating}',
                  style: TextStyle(fontSize: 18.0, color: Colors.black54),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
