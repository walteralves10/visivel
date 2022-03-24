import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visivel/app/components/controls_overlay.dart';

class VideoPlayerWigted extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWigted({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller != null && controller.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: _buildVideo(),
          )
        : Container(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  Widget _buildVideo() => _buildVideoPlayerWigted();
  Widget _buildVideoPlayerWigted() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            VideoPlayer(controller),
            ControlsOverlay(controller: controller),
            VideoProgressIndicator(controller, allowScrubbing: true),
          ],
        ),
      );
}
