// lib/pages/broadcast_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart'; // Ensure this package is added to your pubspec.yaml
import 'package:hot_player/pages/display_page.dart'; // Make sure to import DisplayPage

class BroadcastPage extends StatefulWidget {
  @override
  _BroadcastPageState createState() => _BroadcastPageState();
}

class _BroadcastPageState extends State<BroadcastPage> {
  final TextEditingController _messageController = TextEditingController();
  BroadcastReceiver receiver = BroadcastReceiver(
    names: <String>[
      "your.package.name.broadcast_action", // Replace with your actual action name
    ],
  );

  @override
  void initState() {
    super.initState();
    receiver.start();
    receiver.messages.listen((message) {
      setState(() {
        // Handle received messages here
        print(message);
        _showReceivedMessage(message);
      });
    });
  }

  @override
  void dispose() {
    receiver.stop();
    super.dispose();
  }

  void _sendBroadcast(String messageToSend) {
    // Example of sending a broadcast with the message
    // In practice, you would use the broadcast package's functionality here
    // For now, we're just navigating to the next page with the message
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayPage(message: messageToSend),
      ),
    );
  }

  void _showReceivedMessage(BroadcastMessage message) {
    // Show the received message in a dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Received Broadcast Message'),
          content: Text(message.name),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Broadcast'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'Enter message',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Send Broadcast'),
            onPressed: () {
              // Retrieve the message from the TextField or another source
              String messageToSend = _messageController.text;
              _sendBroadcast(messageToSend);
            },
          ),
          Expanded(
            child: StreamBuilder<BroadcastMessage>(
              initialData: null,
              stream: receiver.messages,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                    return Text(snapshot.data?.name ?? '');
                  case ConnectionState.none:
                  case ConnectionState.done:
                  case ConnectionState.waiting:
                  default:
                    return SizedBox.shrink(); // Show nothing if no data
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
