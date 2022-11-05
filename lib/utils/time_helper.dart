import 'package:intl/intl.dart';

class TimeHelper {
  static String getCurrentDate(String type) {
    DateTime now = DateTime.now();
    String date = DateFormat(type).format(now);
    return date;
  }
}
