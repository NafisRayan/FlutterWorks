import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import the package

import 'package:hot_player/pages/broadcast_page.dart';
import 'package:hot_player/pages/battery_percentage_page.dart';
import 'package:hot_player/pages/image_page.dart';
import 'package:hot_player/pages/audio_page.dart';
import 'package:hot_player/pages/video_page.dart';
import 'package:hot_player/pages/display_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halar vai tham'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: CachedNetworkImage(
                imageUrl:
                    'https://th.bing.com/th/id/R.51c4fcd0829ded28d70354ed1574e2d9?rik=QPk4Me48%2fJ35AQ&pid=ImgRaw&r=0',
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            ListTile(
              title: Text('Broadcast'),
              onTap: () {
                _navigateToPage(context, BroadcastPage());
              },
            ),
            ListTile(
              title: Text('Battery Percentage'),
              onTap: () {
                _navigateToPage(context, BatteryPercentagePage());
              },
            ),
            ListTile(
              title: Text('Image'),
              onTap: () {
                _navigateToPage(context, ImagePage());
              },
            ),
            ListTile(
              title: Text('Audio'),
              onTap: () {
                _navigateToPage(context, AudioPage());
              },
            ),
            ListTile(
              title: Text('Video'),
              onTap: () {
                _navigateToPage(context, VideoPage());
              },
            ),
          ],
        ),
      ),
      body: Center(child: Text('Halar vai tham')),
    );
  }

  void _navigateToPage(BuildContext context, Widget page) {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    } catch (e) {
      print("Failed to navigate: $e");
    }
  }
}
