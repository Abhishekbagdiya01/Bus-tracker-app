import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track-n-Go Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Track-n-go app is a city bus service for Jodhpur, the district of Rajasthan state in India, and it owns the City Bus Live Tracking application. You are advised to read this privacy policy and if you do not agree to the terms & Conditions of this policy then please do not use or access our City Bus Live Tracking application.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 15.0),
            Text(
              'Prohibited Activities',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'The user may not, whether it is by himself or anyone on his behalf, proceed with the following actions:',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10.0),
            buildListItem(
                'Unauthorized access (copy, modify, translate, reverse engineering, decompile, or decompress) to City Bus Live Tracking application or the services, information (or any part thereof);'),
            buildListItem(
                'Collaborating, interfering with, or disrupting the operation of the Service, or the servers or networks that host the Service, or disobeying any requirements, procedures, policies, or regulations of such servers or networks;'),
            buildListItem(
                'Using the City Bus Live Tracking application services and/or in connection with any spam, unsolicited mail, wire fraud, or similar conduct;'),
            buildListItem(
                'Transmitting data, Trojan, injections, or otherwise making available in connection with the mobile services any virus, worm, web bug, spyware, or any other computer code, file, or program that may or is intended to damage or hijack the operation of any hardware, software, or telecommunications equipment.'),
            buildListItem(
                'Creating a database by systematically downloading and storing all or any of the content from the Service;'),
            SizedBox(height: 15.0),
            Text(
              'Changes to this Privacy Policy',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Jodhpur City Transport Services Limited may amend this policy from time to time. If we make any changes to the policy, then we will notify the Track-n-Go City Bus Live Tracking application user by notification.',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.remove, color: Colors.red),
        SizedBox(width: 5.0),
        Flexible(
          child: Text(
            text,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
