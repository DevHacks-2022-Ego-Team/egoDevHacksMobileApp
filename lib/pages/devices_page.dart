import 'package:flutter/material.dart';
import 'package:safety_driving/widget/navigation_drawer_widget.dart';

class DevicesPage extends StatelessWidget {
  DevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Devices'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(children: [
        Center(
            child: OutlinedButton(
          style: outlineButtonStyle,
          onPressed: () {},
          child: Text('Connect wearable'),
        )),
        Center(
          child: OutlinedButton(
              style: outlineButtonStyle,
              onPressed: () {},
              child: Text('Connect vehicle')),
        )
      ]),
    );
  }

  final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: Colors.black87,
    minimumSize: const Size(200, 100),
    padding: const EdgeInsets.symmetric(horizontal: 30),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
}
