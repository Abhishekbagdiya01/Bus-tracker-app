import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Track-n-Go'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Track-n-Go: Making Jodhpur Explorations Easier',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Track-n-Go is proud to be the first city app of Jodhpur, Rajasthan, India. We are dedicated to catering to the needs of Jodhpur citizens and visitors alike, providing valuable information about city bus routes to make navigating Jodhpur effortless.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 15.0),
            Text(
              'Your Trusted Travel Partner in Jodhpur',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'We are more than just a city bus information platform; Track-n-Go is your online travel companion in Jodhpur. Our commitment to providing comprehensive information about all Jodhpur City Bus routes ensures a smooth and hassle-free travel experience for everyone.',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
