import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:get_well/core/constants/styles.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:get_well/core/routes/routes.dart';

import '../../core/helper/navigateable.dart';

class SearchScreen extends StatefulWidget implements Navigateable {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();

  @override
  String getName() {
    return Routes.search_screen;
  }
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;

  late DateTime _selectedDate;

  final CalendarWeekController _controller = CalendarWeekController();

  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(now.year, now.month + 3, 0);
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 2));
  }

  String _selectedDate1 = '';
  List<DateTime> _dateCount = [];
  String _range = '';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate1 = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value;
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // body: ListView(
          //   children: [
          //     Column(
          //       children: <Widget>[
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           mainAxisSize: MainAxisSize.min,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: <Widget>[
          //             Text('Selected date: $_selectedDate1'),
          //             Text('Selected date count:$_dateCount'),
          //             Text('Selected range: $_range'),
          //             Text('Selected ranges count: $_rangeCount')
          //           ],
          //         ),
          //         Container(
          //           child: SfDateRangePicker(
          //             onSelectionChanged: _onSelectionChanged,
          //             selectionMode: DateRangePickerSelectionMode.multiple,
          //             selectionColor: Styles.k_main_color,
          //             selectionShape: DateRangePickerSelectionShape.rectangle,
          //             monthViewSettings: DateRangePickerMonthViewSettings(
          //               firstDayOfWeek: 1,
          //             ),
          //             backgroundColor: Styles.k_border_primary_color,
          //             headerHeight: 100,
          //             headerStyle: DateRangePickerHeaderStyle(
          //               textAlign: TextAlign.center,
          //               textStyle: TextStyle(
          //                   color: Colors.blue,
          //                   fontSize: 18,
          //                   fontWeight: FontWeight.w400),
          //               backgroundColor: Colors.grey,
          //             ),
          //             showNavigationArrow: true,
          //             monthCellStyle: DateRangePickerMonthCellStyle(
          //               textStyle: TextStyle(
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 15,
          //                 color: Styles.k_main_color,
          //               ),
          //               todayTextStyle: TextStyle(
          //                   fontSize: 15,
          //                   fontWeight: FontWeight.w500,
          //                   color: Styles.k_white_color),
          //             ),
          //           ),
          //           margin: EdgeInsets.only(top: 16),
          //           padding: EdgeInsets.all(16),
          //           decoration: BoxDecoration(
          //             color: Styles.k_black_color,
          //             borderRadius: BorderRadius.all(
          //               Radius.circular(12),
          //             ),
          //           ),
          //         ),
          //         Column(
          //           children: [
          //             SingleChildScrollView(
          //               scrollDirection: Axis.horizontal,
          //               physics: const ClampingScrollPhysics(),
          //               child: Row(
          //                 children: List.generate(
          //                   lastDayOfMonth.day,
          //                   (index) {
          //                     final currentDate =
          //                         lastDayOfMonth.add(Duration(days: index + 0));
          //                     final dayName = DateFormat('E').format(currentDate);
          //                     return Padding(
          //                       padding: EdgeInsets.only(
          //                           left: index == 0 ? 16.0 : 0.0, right: 16.0),
          //                       child: GestureDetector(
          //                         onTap: () => setState(() {
          //                           selectedIndex = index;
          //                         }),
          //                         child: Column(
          //                           mainAxisAlignment: MainAxisAlignment.center,
          //                           children: [
          //                             Container(
          //                               height: 42.0,
          //                               width: 42.0,
          //                               alignment: Alignment.center,
          //                               decoration: BoxDecoration(
          //                                 color: selectedIndex == index
          //                                     ? Colors.orange
          //                                     : Colors.transparent,
          //                                 borderRadius:
          //                                     BorderRadius.circular(44.0),
          //                               ),
          //                               child: Text(
          //                                 dayName.substring(0, 1),
          //                                 style: TextStyle(
          //                                   fontSize: 24.0,
          //                                   color: selectedIndex == index
          //                                       ? Colors.white
          //                                       : Colors.black54,
          //                                   fontWeight: FontWeight.bold,
          //                                 ),
          //                               ),
          //                             ),
          //                             const SizedBox(height: 8.0),
          //                             Text(
          //                               "${index + 1}",
          //                               style: const TextStyle(
          //                                 fontSize: 16.0,
          //                                 color: Colors.black54,
          //                                 fontWeight: FontWeight.bold,
          //                               ),
          //                             ),
          //                             const SizedBox(height: 8.0),
          //                             Container(
          //                               height: 2.0,
          //                               width: 28.0,
          //                               color: selectedIndex == index
          //                                   ? Colors.orange
          //                                   : Colors.transparent,
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     );
          //                   },
          //                 ),
          //               ),
          //             ),
          //             CalendarTimeline(
          //               initialDate: _selectedDate,
          //               firstDate: DateTime.now(),
          //               lastDate: DateTime.now().add(Duration(days: 365 * 4)),
          //               onDateSelected: (date) =>
          //                   setState(() => _selectedDate = date),
          //               monthColor: Colors.white70,
          //               dayColor: Colors.teal[200],
          //               dayNameColor: Color(0xFF333A47),
          //               activeDayColor: Colors.white,
          //               activeBackgroundDayColor: Colors.redAccent[100],
          //               dotsColor: Color(0xFF333A47),
          //               selectableDayPredicate: (date) => date.day != 3,
          //             ),
          //             SizedBox(height: 20),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 16),
          //               child: TextButton(
          //                 style: ButtonStyle(
          //                   backgroundColor:
          //                       MaterialStateProperty.all(Colors.teal[200]),
          //                 ),
          //                 child: Text(
          //                   'RESET',
          //                   style: TextStyle(color: Color(0xFF333A47)),
          //                 ),
          //                 onPressed: () => setState(() => _resetSelectedDate()),
          //               ),
          //             ),
          //             SizedBox(height: 20),
          //             Center(
          //               child: Text(
          //                 'Selected date is $_selectedDate1',
          //                 style: TextStyle(color: Colors.white),
          //               ),
          //             ),
          //             Container(
          //                 decoration: BoxDecoration(boxShadow: [
          //                   BoxShadow(
          //                       color: Colors.black.withOpacity(0.2),
          //                       blurRadius: 10,
          //                       spreadRadius: 1)
          //                 ]),
          //                 child: CalendarWeek(
          //                   controller: _controller,
          //                   height: 100,
          //                   showMonth: true,
          //                   minDate: DateTime.now().add(
          //                     Duration(days: -365),
          //                   ),
          //                   maxDate: DateTime.now().add(
          //                     Duration(days: 365),
          //                   ),
          //                   onDatePressed: (DateTime datetime) {
          //                     // Do something
          //                     setState(() {});
          //                   },
          //                   onDateLongPressed: (DateTime datetime) {
          //                     // Do something
          //                   },
          //                   onWeekChanged: () {
          //                     // Do something
          //                   },
          //                   monthViewBuilder: (DateTime time) => Align(
          //                     alignment: FractionalOffset.center,
          //                     child: Container(
          //                         margin: const EdgeInsets.symmetric(vertical: 4),
          //                         child: Text(
          //                           DateFormat.yMMMM().format(time),
          //                           overflow: TextOverflow.ellipsis,
          //                           textAlign: TextAlign.center,
          //                           style: TextStyle(
          //                               color: Colors.blue,
          //                               fontWeight: FontWeight.w600),
          //                         )),
          //                   ),
          //                   decorations: [
          //                     DecorationItem(
          //                         decorationAlignment:
          //                             FractionalOffset.bottomRight,
          //                         date: DateTime.now(),
          //                         decoration: Icon(
          //                           Icons.today,
          //                           color: Colors.blue,
          //                         )),
          //                     DecorationItem(
          //                         date: DateTime.now().add(Duration(days: 3)),
          //                         decoration: Text(
          //                           'Holiday',
          //                           style: TextStyle(
          //                             color: Colors.brown,
          //                             fontWeight: FontWeight.w600,
          //                           ),
          //                         )),
          //                   ],
          //                 )),
          //             Center(
          //               child: Text(
          //                 '${_controller.selectedDate.day}/${_controller.selectedDate.month}/${_controller.selectedDate.year}',
          //                 style: TextStyle(fontSize: 30),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
