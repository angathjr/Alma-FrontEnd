import 'package:get/get.dart';

class EventCalendarController extends GetxController {
  
  var selectedDay = DateTime.now().obs;

  var job=[].obs;

  void onDaySelected(DateTime day, DateTime focusedDay) {
    selectedDay.value = day;
  }
}
