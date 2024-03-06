import 'package:flutter/material.dart';

extension TimeUtil on TimeOfDay {
  static TimeOfDay parse(String time) {
    final data = time.split(":");
    return TimeOfDay(
      hour: int.parse(data[0]),
      minute: int.parse(data[1]),
    );
  }

  String get stringify {
    var time = this;
    if (time.hour > 12 || (time.hour == 12 && time.minute > 0)) {
      // PM
      var hr = time.hour == 12 ? 12 : time.hour - 12;
      return "$hr:${time.minute.toString().padLeft(2, '0')} PM";
    } else {
      //AM
      var hr = time.hour == 0 ? 12 : time.hour;
      return "$hr:${time.minute.toString().padLeft(2, '0')} AM";
    }
  }

  List<String> get stringify2 {
    var time = this;
    if (time.hour > 12 || (time.hour == 12 && time.minute > 0)) {
      // PM
      var hr = time.hour == 12 ? 12 : time.hour - 12;
      return ["$hr:${time.minute.toString().padLeft(2, '0')}", 'PM'];
    } else {
      //AM
      var hr = time.hour == 0 ? 12 : time.hour;
      return ["$hr:${time.minute.toString().padLeft(2, '0')}", "AM"];
    }
  }
}
