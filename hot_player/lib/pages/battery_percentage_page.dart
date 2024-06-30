import 'package:flutter/material.dart';

class BatteryPercentagePage extends StatelessWidget {
  const BatteryPercentagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Battery Percentage'),
      ),
      body: Center(
        child: Text('Battery Percentage Page Content'),
      ),
    );
  }
}
