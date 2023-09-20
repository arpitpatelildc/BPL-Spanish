import 'package:flutter/material.dart';
import 'package:sif_book/startup/globals.dart';

class NeuroscienceUI extends StatefulWidget {
  const NeuroscienceUI({Key? key}) : super(key: key);

  @override
  State<NeuroscienceUI> createState() => _NeuroscienceUIState();
}

class _NeuroscienceUIState extends State<NeuroscienceUI> {
  @override
  // The widget being built here is the entire screen, and the body: ListWidget() creates an inner widget that is the list of NeuroscienceUI (ToC).
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BPL® Method',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: headerFontSize),
        ),
        toolbarHeight: headerHeight,
      ),
      body: //Padding(
          //padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
          //child:
          Center(
        child: Scaffold(
          body: ListWidget(),
        ),
      ),
      // ),
    );
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
            color: Colors.blueGrey.shade50,
            child: Image.asset(
              "assets/images/bpl_Logo.png",
              height: 65,
              alignment: Alignment.bottomCenter,
            )),
        body: Padding(
            padding: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
            child: Scrollbar(
                isAlwaysShown: true,
                thickness: 10,
                radius: Radius.circular(5),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
                  child: ListView(children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'OUR BRAIN PATH LANGUAGE® SYSTEM, OR BPL®, IS A REVOLUTIONARY TEACHING SYSTEM.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: titleFontSize, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Why does the Brain Path Language system make language learning easier and more enjoyable?. The answer has to do with how our brain processes information. Learning a language involves the skills of talking, listening, reading, and writing; all actions that are developed in different parts of the brain. BPL® developsall these skills andconnects the cerebral learning centers. When we guide you to understand your own brain processes you become motivated to work toward your goals.',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: subtitleFontSize),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'These are the seven learning keys of BPL®:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: titleFontSize, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Image.asset(
                      "assets/images/neuro_Flow.png",
                      height: 4 * headerHeight,
                      alignment: Alignment.bottomCenter,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Click to read about each of the learning keys in more detail:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: titleFontSize, fontWeight: FontWeight.bold),
                    ),
                    ExpansionTile(
                        title: Row(children: <Widget>[
                          Image.asset(
                            "assets/images/NeuroKeys/Exercise.jpg",
                            height: 0.75 * headerHeight,
                            alignment: Alignment.bottomCenter,
                          ),
                          Text(
                            'Key 1',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        children: [
                          Text(
                            'Your brain is an amazing organ. You have millions of neurons which store information in many different ways. When you learn a language, there are neurons that store verbal information. There are also neurons which store auditory information. When you read, your neurons store the symbols which make up the written language and your brain decodes the symbols. Today you will start to store the information of this new language.\n',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: subtitleFontSize),
                          ),
                        ]),
                    ExpansionTile(
                        title: Row(children: <Widget>[
                          Image.asset(
                            "assets/images/NeuroKeys/Wiring.jpg",
                            height: 0.75 * headerHeight,
                            alignment: Alignment.bottomCenter,
                          ),
                          Text(
                            'Key 2',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        children: [
                          Text(
                            'When our brain receives stimulation, it accesses the stored information, and begins to create neuropaths which connect the different neurons. Today we are going to interconnect these neurons. With stimulation and practice the neuropaths will become stronger and stronger and your ability to speak Spanish will improve.\n',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: subtitleFontSize),
                          ),
                        ]),
                    ExpansionTile(
                        title: Row(children: <Widget>[
                          Image.asset(
                            "assets/images/NeuroKeys/Sensory.jpg",
                            height: 0.75 * headerHeight,
                            alignment: Alignment.bottomCenter,
                          ),
                          Text(
                            'Key 3',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        children: [
                          Text(
                            'The learning process is reinforced through our senses. When the senses are stimulated, more information is retained in our long-termmemory. BPL® uses visual, tactile and auditory techniques which stimulate the senses to reinforce language learning.\n',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: subtitleFontSize),
                          ),
                        ]),
                    ExpansionTile(
                        title: Row(children: <Widget>[
                          Image.asset(
                            "assets/images/NeuroKeys/Attention.jpg",
                            height: 0.75 * headerHeight,
                            alignment: Alignment.bottomCenter,
                          ),
                          Text(
                            'Key 4',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        children: [
                          Text(
                            'Our normal attention span is around 15 minutes. We focus for a short time and then our minds begin to wander. This is a natural process, but when it happens the student can get lost and will be unable to retain new information. With the BPL® system, our teachers are trained to recognize this and bring the student’s attention back to the classroom.\n',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: subtitleFontSize),
                          ),
                        ]),
                    ExpansionTile(
                        title: Row(children: <Widget>[
                          Image.asset(
                            "assets/images/NeuroKeys/Neuroplasticity.jpg",
                            height: 0.75 * headerHeight,
                            alignment: Alignment.bottomCenter,
                          ),
                          Text(
                            'Key 5',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        children: [
                          Text(
                            'Science shows that your brain is always storing new information and creating new neuropaths. Our message today is that learning is not reserved just for children, because it is possible for everyone to learn new skills no matter what their age.\n',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: subtitleFontSize),
                          ),
                        ]),
                    ExpansionTile(
                        title: Row(children: <Widget>[
                          Image.asset(
                            "assets/images/NeuroKeys/ShortLongMem.jpg",
                            height: 0.75 * headerHeight,
                            alignment: Alignment.bottomCenter,
                          ),
                          Text(
                            'Key 6',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        children: [
                          Text(
                            'When a student learns new information,it is stored in the cortex. Then it is redistributed either to the short term memory or long term memory of our brain. Repetition in different ways will insure that the new information is stored in the long term memory, which reinforces permanent language learning.\n',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: subtitleFontSize),
                          ),
                        ]),
                    ExpansionTile(
                        title: Row(children: <Widget>[
                          Image.asset(
                            "assets/images/NeuroKeys/Exploration.jpg",
                            height: 0.75 * headerHeight,
                            alignment: Alignment.bottomCenter,
                          ),
                          Text(
                            'Key 7',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        children: [
                          Text(
                            'Get to know the culture and language! They go together and make your learning experience more enjoyable. When you are curious, when you travel, when you hear new music, or try new foods, and when you explore new places you are expanding the neuro-connections in your brain.\n',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: subtitleFontSize),
                          ),
                        ]),
                    SizedBox(
                      height: 25,
                    ),
                  ]),
                )
            )
        )
    );
  }
}
