import 'package:flutter/material.dart';
import 'package:home_monitor_flutter/service.dart';
import 'package:home_monitor_flutter/device.dart';
import 'package:home_monitor_flutter/widgets/device_widget.dart';
import 'package:home_monitor_flutter/widgets/filter_devices_widget.dart';
import 'package:home_monitor_flutter/widgets/notifications_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Home monitor",
        theme: ThemeData(primaryColor: Colors.blue, dividerColor: Colors.brown),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  List<Device> devices = new List<Device>();
  List<Device> filteredDevices = new List<Device>();
  String activeFilter = "All";

  _HomeScreenState() {
    Service.getDevices().then((response) => {
          setState(() {
            devices = response;
            filteredDevices = devices;
          })
        });
  }

  @override
  build(context) {
    return Scaffold(
        appBar: new AppBar(
          title: NotificationsWidget(),
        ),
        body: Column(children: <Widget>[
          new Row(children: <Widget>[
            new Flexible(
              child: new FilterDevicesWidget(
                  location: "All",
                  filterCallback: _filter,
                  activeFilter: activeFilter),
            ),
            new Flexible(
              child: new FilterDevicesWidget(
                  location: "Bathroom",
                  filterCallback: _filter,
                  activeFilter: activeFilter),
            ),
            new Flexible(
              child: new FilterDevicesWidget(
                  location: "Bedroom",
                  filterCallback: _filter,
                  activeFilter: activeFilter),
            ),
            new Flexible(
              child: new FilterDevicesWidget(
                  location: "Kitchen",
                  filterCallback: _filter,
                  activeFilter: activeFilter),
            ),
            new Flexible(
              child: new FilterDevicesWidget(
                  location: "Living-room",
                  filterCallback: _filter,
                  activeFilter: activeFilter),
            ),
            new Flexible(
              child: new FilterDevicesWidget(
                  location: "Lobby",
                  filterCallback: _filter,
                  activeFilter: activeFilter),
            )
          ]),
          new Expanded(
              flex: 8,
              child: GridView.builder(
                  itemCount: filteredDevices.length,
                  itemBuilder: (context, index) =>
                      DeviceWidget(device: filteredDevices[index]),
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3)))
        ]));
  }

  _filter(String location) {
    setState(() {
      if (location == "All") {
        filteredDevices = devices;
      } else {
        filteredDevices = devices.where((d) => d.location == location).toList();
      }

      activeFilter = location;
    });
  }
}
