import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visivel/app/components/video_player_widget.dart';

class AssetPlayerView extends StatefulWidget {
  const AssetPlayerView({Key? key}) : super(key: key);

  @override
  State<AssetPlayerView> createState() => _AssetPlayerViewState();
}

class _AssetPlayerViewState extends State<AssetPlayerView> {
  final asset = 'assets/Butterfly-209.mp4';
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(asset)
      ..addListener(() => {setState(() {})})
      ..setLooping(true)
      //..play()
      ..initialize().then((_) => setState(() {})); //
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = _controller.value.volume == 0;

    return Column(
      children: [
        VideoPlayerWigted(controller: _controller),
        const SizedBox(height: 32),
        if (_controller != null && _controller.value.isInitialized)
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            child: IconButton(
                onPressed: () => _controller.setVolume(isMuted ? 1 : 0),
                icon: Icon(
                  isMuted ? Icons.volume_mute : Icons.volume_up,
                  color: Colors.white,
                )),
          )
      ],
    );
  }
}

/*
SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          const Text('With assets mp4'),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
*/