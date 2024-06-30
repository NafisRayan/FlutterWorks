import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import the package

import 'pages/broadcast_page.dart';
import 'pages/battery_percentage_page.dart';
import 'pages/image_page.dart';
import 'pages/audio_page.dart';
import 'pages/video_page.dart';

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
                    'https://i.pinimg.com/originals/f6/d7/17/f6d717e74150053faa708fbea77c39f5.jpg',
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
