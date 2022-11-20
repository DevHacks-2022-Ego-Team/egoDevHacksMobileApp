import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:safety_driving/widget/navigation_drawer_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(title: Text('Settings')),
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            SettingsGroup(title: 'General', children: <Widget>[
              buildImpactDetection(context),
              buildMinHeartRate(context),
              buildMaxHeartRate(context),
              buildEmergencyContact(context)
            ])
          ],
        )),
      );

  Widget buildImpactDetection(BuildContext context) => SwitchSettingsTile(
        settingKey: 'anomaly-detection',
        title: 'Anomaly detection',
        defaultValue: true,
      );
  Widget buildMinHeartRate(BuildContext context) =>
      TextInputSettingsTile(settingKey: 'min-hr', title: 'Minimum HR');

  Widget buildMaxHeartRate(BuildContext context) =>
      TextInputSettingsTile(settingKey: 'max-hr', title: 'Maximum HR');

  Widget buildEmergencyContact(BuildContext context) => TextInputSettingsTile(
      settingKey: 'emergency-contact', title: 'Emergency contact');
}
