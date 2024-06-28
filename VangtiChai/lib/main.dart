import 'package:flutter/material.dart';

void main() {
  runApp(VangtiChaiApp());
}

class VangtiChaiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vangti Chai',
      theme: ThemeData(
        brightness: Brightness.light, // Default to light theme
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode
          .system, // This allows the app to use the system's preferred theme
      home: VangtiChaiHomePage(),
    );
  }
}

class VangtiChaiHomePage extends StatefulWidget {
  @override
  _VangtiChaiHomePageState createState() => _VangtiChaiHomePageState();
}

class _VangtiChaiHomePageState extends State<VangtiChaiHomePage> {
  String _amount = ''; // Initialize as an empty string
  bool _isNightMode = false;
  Map<int, int> _change = {};

  void _onDigitPress(String digit) {
    setState(() {
      _amount += digit;
      _calculateChange();
    });
  }

  void _onClearPress() {
    setState(() {
      _amount = '';
      _change = {};
    });
  }

  void _calculateChange() {
    int amount = int.tryParse(_amount) ?? 0;
    List<int> notes = [500, 100, 50, 20, 10, 5, 2, 1];
    Map<int, int> change = {};
    for (int note in notes) {
      if (amount >= note) {
        change[note] = amount ~/ note;
        amount %= note;
      }
    }
    setState(() {
      _change = change;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _isNightMode ? Colors.grey[900] : Colors.blue,
        title: Text('Vangti Chai', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(_isNightMode ? Icons.brightness_7 : Icons.brightness_4),
          onPressed: () {
            setState(() {
              _isNightMode = !_isNightMode;
            });
          },
        ),
        elevation: 4.0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildLandscapeLayout();
          } else {
            return _buildPortraitLayout();
          }
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: [
        _buildAmountDisplay(),
        _buildChangeList(),
        _buildKeypad(),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(child: _buildAmountDisplay()),
        Expanded(child: _buildChangeList()),
        Expanded(child: _buildKeypad()),
      ],
    );
  }

  Widget _buildAmountDisplay() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Taka: ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(
            _amount,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildChangeList() {
    return Expanded(
      child: ListView(
        children: _change.entries.map((entry) {
          return ListTile(
            title:
                Text('${entry.key} Taka Notes', style: TextStyle(fontSize: 18)),
            trailing: Text('${entry.value}', style: TextStyle(fontSize: 18)),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildKeypad() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        if (index < 9) {
          return _buildKeypadButton('${index + 1}');
        } else if (index == 9) {
          return _buildKeypadButton('0');
        } else if (index == 10) {
          return Container(); // Empty space
        } else {
          return _buildKeypadButton('Clear');
        }
      },
    );
  }

  Widget _buildKeypadButton(String label) {
    return GestureDetector(
      onTap: () {
        if (label == 'Clear') {
          _onClearPress();
        } else {
          _onDigitPress(label);
        }
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
          color: _isNightMode ? Colors.grey[800] : Colors.blue,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
