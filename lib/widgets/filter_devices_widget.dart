import 'package:flutter/material.dart';

class FilterDevicesWidget extends StatefulWidget {
  final String location;
  final Function(String) filterCallback;
  final String activeFilter;

  FilterDevicesWidget(
      {Key key, this.location, this.activeFilter, this.filterCallback})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _FilterDevicesState();
}

class _FilterDevicesState extends State<FilterDevicesWidget> {
  IconData _getIcon(String location) {
    IconData icon;
    switch (widget.location) {
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
    switch (widget.location) {
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
        margin: const EdgeInsets.all(1),
        color: Colors.white,
        width: double.infinity,
        child: RaisedButton(
            color: widget.activeFilter == widget.location
                ? Colors.lightGreen
                : Colors.white,
            onPressed: () {
              widget.filterCallback(widget.location);
            },
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(_getIcon(widget.location),
                      size: 25, color: _getIconColor(widget.location)),
                ])));
  }
}
