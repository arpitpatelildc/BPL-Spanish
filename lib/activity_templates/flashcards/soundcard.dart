import 'package:flutter/material.dart';
import 'package:sif_book/startup/globals.dart';
import 'package:just_audio/just_audio.dart';

class SoundCard extends StatelessWidget {
  final String text;
  final AudioPlayer player;
  final String path;
  const SoundCard({Key? key, required this.text, required this.player, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            clipBehavior: Clip.hardEdge,
            color: sifBlue,
            child: Center(
              // mainAxisAlignment: MainAxisAlignment.center,
            child:  FittedBox(
                    // width: 200,
                    fit: BoxFit.fill,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Text(
                              text,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: headerFontSize-2,
                                  color: Colors.white
                              )
                          ),
                          FloatingActionButton (
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              heroTag: "audio",
                              mini: true,
                              onPressed: () async {
                                await player.setAsset(path);
                                player.play();
                              },
                              child:
                              const Icon(
                                Icons.campaign,
                                color: Colors.white,
                                size: 30.0,
                              )
                          )
                        ]
                    )
                )
            )
        )
    );
     //    elevation: 0,
     //    color: sifBlue,
     //    child: Center(
     // child: SizedBox(height: 100.0, width: 250,
     //        child: Row(
     //          mainAxisAlignment: MainAxisAlignment.center,
     //        children: [
     //          Text(
     //            text,
     //            textAlign: TextAlign.left,
     //            overflow: TextOverflow.clip,
     //            maxLines: null,
     //            style: TextStyle(
     //              fontSize: headerFontSize-2,
     //              color: Colors.white
     //            ),
     //          ),
     //          FloatingActionButton(
     //            backgroundColor: Colors.transparent,
     //            elevation: 0,
     //            heroTag: "audio",
     //            mini: true,
     //            onPressed: () async {
     //              await player.setAsset(path);
     //              player.play();
     //            },
     //            child:
     //              const Icon(
     //                Icons.campaign,
     //                color: Colors.white,
     //                size: 30.0,
     //              )
     //          )
     //        ]
     //      )
     //    ))
  }
}