import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:sif_book/startup/globals.dart';
import 'flashcard.dart';
import 'soundcard.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:just_audio/just_audio.dart';

class FlashcardUI extends StatefulWidget {
  final dynamic flashcardJSON;
  final int activityIndex;

  const FlashcardUI(
      {Key? key, required this.flashcardJSON, required this.activityIndex})
      : super(key: key);

  @override
  _FlashcardUIState createState() => _FlashcardUIState();
}

class _FlashcardUIState extends State<FlashcardUI> {
  int _index = 0;
  String generalImg = 'assets/images/cerebrillo.png';

  late FlipCardController controller;
  late AudioPlayer player;
  bool isFlipped = false;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showMaterialDialog(context, false),
          label: Text('?', style: TextStyle(fontSize: titleFontSize)),
          backgroundColor: sifBlue),
      appBar: AppBar(
        title: const Text('Flashcards'),
        toolbarHeight: headerHeight,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                // Used for the image display on the flashcard activity
                width: 400,
                height: 100,
                child: Image.asset(widget.flashcardJSON[_index]['Path'])),
            SizedBox(
                width: 400,
                height: 250,
                child: FlipCard(
                  onFlipDone: (status) {
                    isFlipped = status;
                  },
                  controller: controller,
                  // The front/back text for the flashcards
                  front: ((widget.flashcardJSON[_index]['Audio'] == "" || widget.flashcardJSON[_index]['Audio'] == null)
                      ? Flashcard(text: widget.flashcardJSON[_index]['Question'])
                      : SoundCard(text: widget.flashcardJSON[_index]['Question'], player: player, path: widget.flashcardJSON[_index]['Audio'])),
                  back: Flashcard(text: widget.flashcardJSON[_index]['Answer']),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              OutlinedButton.icon(
                  onPressed: goBackward,
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Back')),
              OutlinedButton.icon(
                  onPressed: goForward,
                  icon: const Icon(Icons.chevron_right),
                  label: const Text('Next')),
            ])
          ],
        ),
      ),
    );
  }

  // Ideally these methods are contained outside the UI class, but it works fine.
  // These methods loop back around.
  void goForward() {
    setState(() {
      _index = (_index + 1 < widget.flashcardJSON.length) ? _index + 1 : 0;
      // Because of the wrapping above, we check when the index is back at 0.
      if (_index == 0) {
        //activitysComplete += 1;
      }
      if (isFlipped == true) {
        controller.toggleCard();
      }
    });
  }

  void goBackward() {
    setState(() {
      _index =
          (_index - 1 >= 0) ? _index - 1 : (widget.flashcardJSON.length - 1);
      if (isFlipped == true) {
        controller.toggleCard();
      }
    });
  }
}
