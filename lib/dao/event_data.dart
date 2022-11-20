class EventData {
  int _id = 0;
  String _title = '';
  String _description = '';
  String _date = '';
  int _heartRate = -1;
  double _stress = -1;
  double _sleep = -1;
  double _pulseOx = -1;
  double _bodyBattery = -1;

  EventData(this._title, this._date, this._description, this._heartRate,
      this._stress, this._sleep, this._pulseOx, this._bodyBattery);

  EventData.withId(
      this._id,
      this._title,
      this._date,
      this._description,
      this._heartRate,
      this._stress,
      this._sleep,
      this._pulseOx,
      this._bodyBattery);

  int get id => _id;

  String get title => _title;

  String get description => _description;

  String get date => _date;

  int get heartRate => _heartRate;

  double get stress => _stress;

  double get sleep => _sleep;

  double get pulseOx => _pulseOx;

  double get bodyBattery => _bodyBattery;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      this._description = newDescription;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  set heartRate(int heartRate) {
    this._heartRate = heartRate;
  }

  set stress(double stress) {
    this._stress = stress;
  }

  set sleep(double sleep) {
    this._sleep = sleep;
  }

  set pulseOx(double pulseOx) {
    this._pulseOx = pulseOx;
  }

  set bodyBattery(double bodyBattery) {
    this._bodyBattery = bodyBattery;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;

    map['heart_rate'] = this._heartRate;
    map['stress'] = this._stress;
    map['sleep'] = this._sleep;
    map['pulse_ox'] = this._pulseOx;
    map['body_battery'] = this._bodyBattery;

    return map;
  }

  // Extract a Note object from a Map object
  EventData.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._date = map['date'];
    this._heartRate = map['heart_rate'];
    this._stress = map['stress'];
    this._sleep = map['sleep'];
    this._pulseOx = map['pulse_ox'];
    this._bodyBattery = map['body_battery'];
  }
}
