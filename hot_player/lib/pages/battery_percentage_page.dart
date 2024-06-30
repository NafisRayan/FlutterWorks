import 'package:flutter/material.dart';
import 'package:battery/battery.dart';

class BatteryPercentagePage extends StatefulWidget {
  const BatteryPercentagePage({Key? key}) : super(key: key);

  @override
  _BatteryPercentagePageState createState() => _BatteryPercentagePageState();
}

class _BatteryPercentagePageState extends State<BatteryPercentagePage> {
  int _batteryLevel = 0;
  Battery _battery = Battery();

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  Future<void> _getBatteryLevel() async {
    final int batteryLevel = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Percentage'),
      ),
      body: Center(
        child: Text(
          'Battery Level: $_batteryLevel%',
          style:
              const TextStyle(fontSize: 32), // Increase the font size as needed
        ),
      ),
    );
  }
}
