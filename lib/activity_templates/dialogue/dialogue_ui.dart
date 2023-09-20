import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:sif_book/startup/globals.dart';
import 'dialogue_logic.dart';

class DialogueUI extends StatefulWidget {
  // Path to the audio and JSON file containing a transcript of whatever is being spoken.
  final String path;
  final int activityIndex;
  final dynamic transcript;

  const DialogueUI(
      {Key? key,
      required this.path,
      required this.transcript,
      required this.activityIndex})
      : super(key: key);

  @override
  _DialogueUIState createState() => _DialogueUIState();
}

class _DialogueUIState extends State<DialogueUI> {
  late final DialogueLogic _dialogueLogic;

  @override
  void initState() {
    super.initState();
    _dialogueLogic = DialogueLogic(widget.path, widget.activityIndex);
  }

  @override
  void dispose() {
    _dialogueLogic.dispose();
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
        title: const Text('Dialogue'),
        toolbarHeight: headerHeight,
      ),
      body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 30),
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/images/exerciseBrain.png")),
            Expanded(
                child: Scrollbar(
              //thumb: true,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(widget.transcript['transcript'],
                      style: const TextStyle(fontSize: 24))),
            )),
            ValueListenableBuilder<ProgressBarState>(
              valueListenable: _dialogueLogic.progressNotifier,
              builder: (_, value, __) {
                return ProgressBar(
                  progress: value.current,
                  total: value.total,
                  onSeek: _dialogueLogic.seek,
                );
              },
            ),
            ValueListenableBuilder<ButtonState>(
                valueListenable: _dialogueLogic.buttonNotifier,
                builder: (_, value, __) {
                  switch (value) {
                    case ButtonState.paused:
                      return IconButton(
                        icon: const Icon(Icons.play_arrow),
                        iconSize: 32.0,
                        onPressed: _dialogueLogic.play,
                      );
                    case ButtonState.playing:
                      return IconButton(
                        icon: const Icon(Icons.pause),
                        iconSize: 32.0,
                        onPressed: _dialogueLogic.pause,
                      );
                  }
                })
          ])),
    );
  }
}
