import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: SingleChildScrollView(
        // Wrap Column with SingleChildScrollView
        child: Column(
          children: [
            Center(
              child: Text('Image Page Content'),
            ),
            PinchZoom(
              child: Image.network(
                  'https://th.bing.com/th/id/OIF.Xs50BgOp9XP5k14vs2Kr1w?w=194&h=321&c=7&r=0&o=5&pid=1.7'),
              maxScale: 2.5,
              onZoomStart: () {
                print('Start zooming');
              },
              onZoomEnd: () {
                print('Stop zooming');
              },
            ),
          ],
        ),
      ),
    );
  }
}
