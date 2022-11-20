import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:safety_driving/pages/devices_page.dart';
import 'package:safety_driving/pages/events_page.dart';
import 'package:safety_driving/pages/settings_page.dart';
import 'package:safety_driving/provider/navigation_provider.dart';
import 'package:safety_driving/widget/navigation_drawer_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  initSettings().then((_) {
    runApp(MyApp());
  });
}

Future<void> initSettings() async {
  await Settings.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Safety Driving',
          theme: ThemeData(primarySwatch: Colors.lightBlue),
          home: const MyHomePage(title: 'Safety Driving'),
        ),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.events:
        return EventsPage();
      case NavigationItem.settings:
        return SettingsPage();
      case NavigationItem.devices:
        return DevicesPage();
    }
  }
}
