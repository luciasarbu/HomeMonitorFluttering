import 'package:flutter/material.dart';
import 'package:home_monitor_flutter/device.dart';
import 'package:home_monitor_flutter/service.dart';

class DeviceWidget extends StatefulWidget {
  final Device device;

  const DeviceWidget({Key key, this.device}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DeviceState();
}

class _DeviceState extends State<DeviceWidget> {
  IconData _getIcon(String location) {
    IconData icon;
    switch (widget.device.location) {
      case 'Kitchen':
        icon = Icons.kitchen;
        break;
      case 'Bathroom':
        icon = Icons.wc;
        break;
      case 'Bedroom':
        icon = Icons.airline_seat_individual_suite;
        break;
      case 'Living-room':
        icon = Icons.tv;
        break;
      case 'Lobby':
        icon = Icons.home;
        break;
      default:
        icon = Icons.lightbulb_outline;
        break;
    }

    return icon;
  }

  Color _getIconColor(String location) {
    Color color;
    switch (widget.device.location) {
      case 'Kitchen':
        color = Colors.brown;
        break;
      case 'Bathroom':
        color = Colors.blue;
        break;
      case 'Bedroom':
        color = Colors.red[700];
        break;
      case 'Living-room':
        color = Colors.green[900];
        break;
      case 'Lobby':
        color = Colors.yellow[700];
        break;
      default:
        color = Colors.indigo;
        break;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(3),
        color: Colors.white,
        width: double.infinity,
        child: RaisedButton(
            color:
                widget.device.state == "1" ? Colors.lightGreen : Colors.white,
            onPressed: () {
             
                Service.toggleDevice(widget.device.id).then((response) => {
                      if (response.statusCode == 200)
                        {
                           setState(() {
                          widget.device.state == "0"
                              ? widget.device.state = "1"
                              : widget.device.state = "0";
                              })
                        }
                    });
              
            },
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.device.display, style: TextStyle(fontSize: 15)),
                  Icon(_getIcon(widget.device.location),
                      size: 50, color: _getIconColor(widget.device.location)),
                ])));
  }
}
