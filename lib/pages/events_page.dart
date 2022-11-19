import 'package:flutter/material.dart';
import 'package:safety_driving/widget/navigation_drawer_widget.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Most recent events'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
