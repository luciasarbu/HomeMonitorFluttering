class Device {
  String id;
  String type;
  String timeStamp;
  String display;
  String location;
  String state;
  //[typeProp: string]: any;

  Device(String id, String type, String timeStamp, String display,
      String location, String state) {
    this.id = id;
    this.type = type;
    this.timeStamp = timeStamp;
    this.display = display;
    this.location = location;
    this.state = state;
  }

  Device.fromJson(Map json)
      : id = json['id'],
        type = json['type'],
        timeStamp = json['timeStamp'],
        display = json['display'],
        location = json['location'],
        state = json['state'];

  Map toJson() {
    return {
      'id': id,
      'type:': type,
      'timeStamp': timeStamp,
      'display': display,
      'location': location,
      'state': state
    };
  }
}
