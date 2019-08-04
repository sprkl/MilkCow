import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerComponent extends StatefulWidget {
  @override
  VideoPlayerState createState() {
    return new VideoPlayerState();
  }
}

class VideoPlayerState extends State<StatefulWidget> {
  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
    createVideoPlay();
  }

  void createVideoPlay() {
    if (playerController == null) {
      playerController =
          VideoPlayerController.network("https://sparklediag.blob.core.windows.net/sparkle/video.mp4")
            ..addListener(listener)
            ..setVolume(5)
            ..initialize()
            ..play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Center(
            child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                    child: playerController != null
                        ? VideoPlayer(playerController)
                        : Container()))));
  }

  @override
  void dispose() {
    playerController.pause();
    playerController.removeListener(this.listener);
    super.dispose();
  }
}
