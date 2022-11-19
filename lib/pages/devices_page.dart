import 'package:flutter/material.dart';
import 'package:safety_driving/widget/navigation_drawer_widget.dart';

class DevicesPage extends StatelessWidget {
  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Devices'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
