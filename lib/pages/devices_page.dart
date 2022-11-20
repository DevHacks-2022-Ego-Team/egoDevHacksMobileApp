import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:safety_driving/widget/navigation_drawer_widget.dart';

class DevicesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Devices'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: Column(children: <Widget>[
          Center(
            child: SettingsGroup(
              title: 'Connect devices',
              children: [
                TextInputSettingsTile(
                  settingKey: 'wearable-device',
                  title: 'Wearable device',
                ),
                TextInputSettingsTile(title: 'Vehicle', settingKey: 'vehicle')
              ],
            ),
          )
        ]));
  }
}
