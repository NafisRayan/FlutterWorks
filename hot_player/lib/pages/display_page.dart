// lib/pages/display_page.dart

import 'package:flutter/material.dart';
import 'package:hot_player/pages/broadcast_page.dart';

class DisplayPage extends StatelessWidget {
  final String message;

  const DisplayPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Page'),
      ),
      body: Center(
        child: Text(
          'Received Message: $message',
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
