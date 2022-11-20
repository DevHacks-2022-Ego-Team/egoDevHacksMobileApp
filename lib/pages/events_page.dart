import 'package:flutter/material.dart';
import 'package:safety_driving/dao/event_data.dart';
import 'package:safety_driving/repository/events_repository.dart';
import 'package:safety_driving/widget/navigation_drawer_widget.dart';
import 'package:sqflite/sqflite.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<StatefulWidget> createState() => EventsPageState();
}

class EventsPageState extends State<EventsPage> {
  EventsRepository eventsRepository = EventsRepository();
  List<EventData> _eventDataList = <EventData>[];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    updateListView();

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: Center(child: getEventListView()),
    );
  }

  ListView getEventListView() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                title: Text(_eventDataList[position].title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(_eventDataList[position].description),
              ));
        });
  }

  void updateListView() {
    final Future<Database> dbFuture = eventsRepository.initializeDatabase();
    dbFuture.then((database) {
      Future<List<EventData>> eventListFuture = eventsRepository.getEventList();
      eventListFuture.then((eventList) {
        setState(() {
          _eventDataList = eventList;
          count = eventList.length;
          if (count == 0) {
            _eventDataList.add(EventData(
                'You haven\'t had any incidents yet! Yay!',
                '',
                '',
                0,
                0,
                0,
                0,
                0));
            count = 1;
          }
        });
      });
    });
  }
}
