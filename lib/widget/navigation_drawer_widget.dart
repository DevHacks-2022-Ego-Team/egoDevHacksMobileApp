import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safety_driving/provider/navigation_provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
          child: Container(
        color: Color.fromARGB(206, 147, 21, 237),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            buildMenuItem(context,
                text: 'View events', item: NavigationItem.events),
            buildMenuItem(context,
                text: 'Change settings', item: NavigationItem.settings),
            buildMenuItem(context,
                text: 'Connect devices', item: NavigationItem.devices)
          ],
        ),
      ));

  buildMenuItem(BuildContext context,
      {required String text, required NavigationItem item}) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;

    const textColor = Colors.white;

    return Material(
        color: Colors.transparent,
        child: ListTile(
          selected: isSelected,
          selectedTileColor: Colors.white24,
          title: Text(text,
              style: const TextStyle(color: textColor, fontSize: 20)),
          onTap: () => selectItem(context, item),
        ));
  }

  void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }
}

enum NavigationItem { events, settings, devices }
