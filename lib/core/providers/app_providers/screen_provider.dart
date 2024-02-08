import 'package:flutter/widgets.dart';
import 'package:get_well/modules/system/categories/doctors_list_screen.dart';
import '../../../modules/system/category_screen.dart';
import '../../../modules/system/health_screen.dart';
import '../../../modules/system/profile_screen.dart';
import '../../../modules/system/search_screen.dart';

class ScreenProvider with ChangeNotifier {
  int _selectedIndex = 3;

  List<Widget> _options = <Widget>[
    HealthScreen(),
    SearchScreen(),
    CategoryScreen(),
    ProfileScreen(),
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
    _selectedIndex = index;
    notifyListeners();
  }

  void setCurrentWidgetToDoctor() {
    _selectedIndex = 2;
    notifyListeners();
  }
}
