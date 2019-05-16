import 'package:signalr_client/signalr_client.dart';
import 'package:flutter/material.dart';

class NotificationsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationsState();
}

class _NotificationsState extends State<NotificationsWidget> {
  final serverUrl = '192.168.1.201/hub';
  bool watcher = false;
  bool coco = false;
  bool main = false;
  bool jason = false;
  bool thomas = false;

  HubConnection hubConnection;

  _NotificationsState() {
    hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();
    hubConnection.onclose((error) => print("Connection Closed"));
    hubConnection.on("notifications", _handleNotifications);
    hubConnection.on("heartbeats", _handleHeartbeats);
  }

  void _handleNotifications(List<Object> parameters) {}
  void _handleHeartbeats(List<Object> parameters) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(1),
        color: Colors.blue,
        width: double.infinity,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new SizedBox(
                  width: 40,
                  child: this.watcher
                      ? RaisedButton(
                          onPressed: null,
                          child:
                              Text("W", style: TextStyle(color: Colors.blue)))
                      : RaisedButton(
                          onPressed: null,
                          child:
                              Text("W", style: TextStyle(color: Colors.red)))),
              new SizedBox(
                  width: 40,
                  child: this.coco
                      ? RaisedButton(
                          onPressed: null,
                          child:
                              Text("C", style: TextStyle(color: Colors.blue)))
                      : RaisedButton(
                          onPressed: null,
                          child:
                              Text("C", style: TextStyle(color: Colors.red)))),
              new SizedBox(
                  width: 40,
                  child: this.jason
                      ? RaisedButton(
                          onPressed: null,
                          child:
                              Text("J", style: TextStyle(color: Colors.blue)))
                      : RaisedButton(
                          onPressed: null,
                          child:
                              Text("J", style: TextStyle(color: Colors.red)))),
              new SizedBox(
                  width: 40,
                  child: this.main
                      ? RaisedButton(
                          onPressed: null,
                          child:
                              Text("M", style: TextStyle(color: Colors.blue)))
                      : RaisedButton(
                          onPressed: null,
                          child:
                              Text("M", style: TextStyle(color: Colors.red)))),
              new SizedBox(
                  width: 40,
                  child: this.thomas
                      ? RaisedButton(
                          onPressed: null,
                          child:
                              Text("T", style: TextStyle(color: Colors.blue)))
                      : RaisedButton(
                          onPressed: null,
                          child:
                              Text("T", style: TextStyle(color: Colors.red))))
            ]));
  }
}
