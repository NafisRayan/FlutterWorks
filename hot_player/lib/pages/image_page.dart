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
                  'https://media.gettyimages.com/id/1694082464/photo/prada-spring-summer-2024-womenswear-fashion-show-arrivals-and-front-row.jpg?b=1&s=594x594&w=0&k=20&c=gWBQrH8RRVr_ZhzjnE-3YoysfKq7BstlMHHtO4XB9P0='),
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
