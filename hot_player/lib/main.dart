import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import the package

import 'package:hot_player/pages/broadcast_page.dart';
import 'package:hot_player/pages/battery_percentage_page.dart';
import 'package:hot_player/pages/image_page.dart';
import 'package:hot_player/pages/audio_page.dart';
import 'package:hot_player/pages/video_page.dart';
import 'package:hot_player/pages/broadcast_home_page.dart';
// import 'package:hot_player/pages/display_page.dart';

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
        title: const Text('Hot Player'),
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
                    'https://th.bing.com/th/id/OIP.zXznPSs1MTlcCp1ORy0dewHaEK?w=289&h=180&c=7&r=0&o=5&pid=1.7',
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            // Inside the Drawer widget in main.dart
            ListTile(
              title: Text('Broadcast Home'),
              onTap: () {
                _navigateToPage(context, BroadcastHomePage());
              },
            ),
            // ListTile(
            //   title: Text('Broadcast'),
            //   onTap: () {
            //     _navigateToPage(context, BroadcastPage());
            //   },
            // ),
            // ListTile(
            //   title: Text('Battery Percentage'),
            //   onTap: () {
            //     _navigateToPage(context, BatteryPercentagePage());
            //   },
            // ),
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
      body: Center(
          child: Text(
        'Pretty Hot Stuff',
        style: const TextStyle(fontSize: 32),
      )),
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
