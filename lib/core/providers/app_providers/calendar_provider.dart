import 'package:flutter/widgets.dart';
import 'package:get_well/modules/system/drawer/service_pages/calendar_pages/hedache_screen.dart';
import 'package:get_well/modules/system/drawer/service_pages/calendar_pages/pressure_screen.dart';
import 'package:get_well/modules/system/drawer/service_pages/calendar_pages/symptoms_screen.dart';
import 'package:get_well/modules/system/drawer/service_pages/calendar_pages/women_period_screen.dart';
import '../../../modules/system/category_screen.dart';
import '../../../modules/system/health_screen.dart';
import '../../../modules/system/profile_screen.dart';
import '../../../modules/system/search_screen.dart';

class CalendarProvider with ChangeNotifier {
  int _selectedIndex = 0;

  List<Widget> _options = <Widget>[
    HedacheScreen(),
    WomenPeriodScreen(),
    SymptomsScreen(),
    PressureScreen(),
  ];

  int get selectedIndex {
    return _selectedIndex;
  }

  Widget get selectedWidget {
    return _options[_selectedIndex];
  }

  int get length {
    return _options.length;
  }

  void setSelectedIndex(index) {
    _selectedIndex = index - 1;
    notifyListeners();
  }
}
