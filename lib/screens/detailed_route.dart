import 'package:flutter/material.dart';

class DetailedRoute extends StatelessWidget {
  DetailedRoute(
      {required this.busNo,
      required this.busRoute,
      required this.routeStops,
      super.key});
  String busNo;
  String busRoute;
  List routeStops;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Card(
              elevation: 4,
              child: Container(
                height: 100,
                width: MediaQuery.sizeOf(context).width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: ListTile(
                  title: Text(busNo),
                  subtitle: Text(busRoute),
                  trailing: Icon(Icons.arrow_circle_right),
                ),
              ),
            ),
            Stepper(
                physics: NeverScrollableScrollPhysics(),
                controlsBuilder: (context, controls) => SizedBox(
                      height: 2,
                    ),
                steps: [
                  for (String stop in routeStops)
                    Step(
                      isActive: true,
                      title: Text(stop),
                      content: Text(""),
                    ),
                ])
          ],
        ),
      ),
    );
  }
}
