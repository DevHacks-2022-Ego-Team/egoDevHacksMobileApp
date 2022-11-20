import 'package:flutter/material.dart';
import 'package:safety_driving/widget/navigation_drawer_widget.dart';

class DevicesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  String _wearableDevice = 'No wearable device connected';
  String _vehicle = 'No vehicle connected';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Devices'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(children: <Widget>[
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
        ),
        Expanded(
          child: ListView(children: <Widget>[
            buildDeviceItem(context, text: _wearableDevice),
            buildDeviceItem(context, text: _vehicle)
          ]),
        )
      ]),
    );
  }

  buildDeviceItem(BuildContext context, {required String text}) {
    const textColor = Colors.black;

    return Material(
        color: Colors.transparent,
        child: ListTile(
            selectedTileColor: Colors.white24,
            title: Text(text,
                style: const TextStyle(color: textColor, fontSize: 20))));
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
