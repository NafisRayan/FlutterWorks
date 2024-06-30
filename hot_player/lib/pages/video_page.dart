import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    )..initialize().then((_) {
        setState(() {});
        _controller.setLooping(
            true); // Set looping to true if you want the video to loop
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayback() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _controller.play();
      } else {
        _controller.pause();
      }
    });
  }

  void _forward() {
    final position = _controller.value.position;
    final duration = _controller.value.duration;
    if (position < duration) {
      _controller.seekTo(position + Duration(seconds: 5));
    }
  }

  void _rewind() {
    final position = _controller.value.position;
    if (position > Duration.zero) {
      _controller.seekTo(position - Duration(seconds: 5));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.replay_5),
                  onPressed: _rewind,
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: () => _togglePlayback(),
                ),
                IconButton(
                  icon: Icon(Icons.fast_forward),
                  onPressed: _forward,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: LinearProgressIndicator(
              value: _controller.value.position.inSeconds /
                  (_controller.value.duration?.inSeconds ?? 0),
            ),
          ),
        ],
      ),
    );
  }
}
