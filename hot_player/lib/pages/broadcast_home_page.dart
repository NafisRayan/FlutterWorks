import 'package:flutter/material.dart';
import 'package:hot_player/pages/broadcast_page.dart';
import 'package:hot_player/pages/battery_percentage_page.dart';

class BroadcastHomePage extends StatefulWidget {
  @override
  _BroadcastHomePageState createState() => _BroadcastHomePageState();
}

class _BroadcastHomePageState extends State<BroadcastHomePage> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Operation'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: _selectedValue, // Use a state variable to track selection
          hint: Text(
              "Select Option"), // Show "Select Option" as a hint when no selection is made
          icon: Icon(Icons.arrow_downward),
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
            if (_selectedValue == "Custom Broadcast Receiver") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BroadcastPage()),
              );
            } else if (_selectedValue ==
                "System Battery Notification Receiver") {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BatteryPercentagePage()),
              );
            }
          },
          items: <String>[
            'Custom Broadcast Receiver',
            'System Battery Notification Receiver'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
