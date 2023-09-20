import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:sif_book/startup/globals.dart';
import 'flashcard.dart';
import 'package:just_audio/just_audio.dart';
import 'soundcard.dart';

class AlphabetFlashcard extends StatefulWidget {
  final dynamic flashcardJSON;
  final int activityIndex;

  const AlphabetFlashcard(
      {Key? key, required this.flashcardJSON, required this.activityIndex})
      : super(key: key);

  @override
  _AlphaFlashcardState createState() => _AlphaFlashcardState();
}

class _AlphaFlashcardState extends State<AlphabetFlashcard> {
  int _index = 0;
  String generalImg = 'assets/images/cerebrillo.png';

  late AudioPlayer player;
  late FlipCardController controller;
  bool isFlipped = false;

  @override
  void initState() {
    super.initState();
    // AudioPlayer and FlipCardController need to be initialized
    player = AudioPlayer();
    controller = FlipCardController();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showMaterialDialog(context, false),
          label: Text('?', style: TextStyle(fontSize: titleFontSize)),
          backgroundColor: sifBlue),
      appBar: AppBar(
        title: Text('Flashcards',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: headerFontSize)),
        toolbarHeight: headerHeight,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // Used for the image display on the flashcard activity
              width: 400,
              height: 250,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                    // The text outside of the flashcard
                    widget.flashcardJSON[_index]['Text'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: headerFontSize)),
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                FloatingActionButton(
                  // Button for playing the audio outside of the flashcard
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  heroTag: "playAudio",
                  mini: true,
                  onPressed: () async {
                    await player.setAsset(widget.flashcardJSON[_index]['Path']);
                    player.play();
                  },
                  child: Icon(
                    Icons.campaign,
                    color: Colors.black,
                    size: 30.0,
                  ),
                )
              ]),
            ),
            SizedBox(
                width: 210, //400,
                height: 140, //250,
                child: FlipCard(
                  onFlipDone: (status) {
                    // Sets a variable for whether the card is flipped; useful for flipping outside of tapping
                    isFlipped = status;
                  },
                  controller: controller,
                  front: Card(
                    elevation: 0,
                    color: sifBlue,
                    child: Center(
                      child: Text(
                        widget.flashcardJSON[_index]['Click'],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: titleFontSize, color: Colors.white)
                      )
                    )
                  ),
                  // The front of the flashcard just has text, the back has a button with audio for pronunciation
                  back: SoundCard(
                      text: widget.flashcardJSON[_index]['Example'],
                      player: player,
                      path: widget.flashcardJSON[_index]['ExamplePath']),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              // Buttons for switching between flashcards
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
        controller
            .toggleCard(); // If the card is flipped when switching, it flips back to the front for the next one
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
