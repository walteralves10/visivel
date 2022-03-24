import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visivel/app/components/controls_overlay.dart';
import 'package:visivel/app/components/video_player_widget.dart';

class NetworkPlayerView extends StatefulWidget {
  const NetworkPlayerView({Key? key}) : super(key: key);

  @override
  NetworkPlayerViewState createState() => NetworkPlayerViewState();
}

class NetworkPlayerViewState extends State<NetworkPlayerView> {
  late VideoPlayerController _controller;

  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('assets/bumble_bee_captions.vtt');
    return WebVTTCaptionFile(
        fileContents); // For vtt files, use WebVTTCaptionFile
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      closedCaptionFile: _loadCaptions(),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(padding: const EdgeInsets.only(top: 20.0)),
          const Text('With remote mp4'),
          VideoPlayerWigted(controller: _controller)
        ],
      ),
    );
  }
}

/*
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  ClosedCaption(text: _controller.value.caption.text),
                  ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
 */