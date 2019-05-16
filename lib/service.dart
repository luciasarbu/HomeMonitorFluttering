import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:home_monitor_flutter/device.dart';

const baseUrl = 'http://192.168.35.88/FarmMonitorServer/api/';

class Service {
  static Future<List<Device>> getDevices() {
    var url = baseUrl + 'devices';

    return get(url).then((response) {
      String res = response.body;
      int statusCode = response.statusCode;

      if (statusCode == 200) {
        Iterable list = json.decode(res);
        return list.map((model) => Device.fromJson(model)).toList();
      } else {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception(statusCode);
      }
    });
  }

  static Future<Response> toggleDevice(String idDevice) {
    var url = baseUrl + 'devices';
    return put(url, body: {'value': idDevice});
  }
}
