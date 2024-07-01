import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setSourceUrl('assets/2.mp3');
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayback() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
    if (_isPlaying) {
      _audioPlayer.resume();
    } else {
      _audioPlayer.pause();
    }
  }

  void _seek(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _position.toString().split('.').first,
              style: TextStyle(fontSize: 24),
            ),
            Slider(
              value: _position.inSeconds.toDouble(),
              min: 0,
              max: _duration.inSeconds.toDouble(),
              onChanged: (value) {
                _seek(Duration(seconds: value.toInt()));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.replay_5),
                  onPressed: () {
                    _seek(Duration(seconds: _position.inSeconds - 5));
                  },
                ),
                IconButton(
                  icon: _isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                  onPressed: _togglePlayback,
                ),
                IconButton(
                  icon: Icon(Icons.fast_forward),
                  onPressed: () {
                    _seek(Duration(seconds: _position.inSeconds + 5));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
