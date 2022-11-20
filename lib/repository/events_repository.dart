import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../dao/event_data.dart';

class EventsRepository {
  static EventsRepository _eventsRepository =
      EventsRepository._createInstance();
  static Database? _database;

  String eventTable = 'event_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDate = 'date';
  String colHeartRate = 'heart_rate';
  String colStress = 'stress';
  String colSleep = 'sleep';
  String colPulseOx = 'pulse_ox';
  String colBodyBattery = 'bodyBattery';

  EventsRepository._createInstance() {
    _eventsRepository = this;
  }

  factory EventsRepository() {
    return _eventsRepository;
  }

  Future<Database> get database async {
    return _database ??= await initializeDatabase();
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'events.db';

    // Open/create the database at a given path
    var eventsDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return eventsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $eventTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colDate TEXT, $colHeartRate INTEGER, $colStress REAL, $colSleep REAL, $colPulseOx REAL, $colBodyBattery TEXT)');
  }

  Future<List<Map<String, dynamic>>> getEventMapList() async {
    Database db = await this.database;

    var result = await db.query(eventTable, orderBy: '$colDate DESC', limit: 3);
    return result;
  }

  // Insert Operation: Insert a todo object to database
  Future<int> insertEventData(EventData eventData) async {
    Database db = await this.database;
    var result = await db.insert(eventTable, eventData.toMap());
    return result;
  }

  // Delete Operation: Delete a todo object from database
  Future<int> deleteTodo(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $eventTable WHERE $colId = $id');
    return result;
  }

  // Get number of todo objects in database
  Future<int?> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $eventTable');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'todo List' [ List<Todo> ]
  Future<List<EventData>> getEventList() async {
    var eventDataMapList =
        await getEventMapList(); // Get 'Map List' from database
    int count =
        eventDataMapList.length; // Count the number of map entries in db table

    List<EventData> eventDataList = <EventData>[];
    // For loop to create a 'todo List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      eventDataList.add(EventData.fromMapObject(eventDataMapList[i]));
    }

    return eventDataList;
  }
}
