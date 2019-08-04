import 'package:flutter/material.dart';
import 'components/video_player_component.dart';

class EndGamePageView extends StatelessWidget {
  EndGamePageView();
 

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Fin de partie"),
        ),
        body: new Padding(
            padding: EdgeInsets.all(10),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  new Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Vous n'êtes pas satisfaits des performances de votre nouvelle entreprise ?",
                        style: new TextStyle(
                          fontSize: 20,
                        ),
                      )),
                  new Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "C'est normal ! Le prix du lait imposé par les multinationales empêche les producteurs de vivre de leur activité.",
                        style: new TextStyle(
                          fontSize: 20,
                        ),
                      )),
                  new VideoPlayerComponent()
                ])));
  }
}
