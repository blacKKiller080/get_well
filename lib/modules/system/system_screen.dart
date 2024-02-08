import 'package:flutter/material.dart';
import 'package:get_well/modules/system/category_screen.dart';
import 'package:get_well/modules/system/health_screen.dart';
import 'package:get_well/modules/system/drawer/profile_settings_screen.dart';
import 'package:get_well/modules/system/profile_screen.dart';
import 'package:get_well/modules/system/search_screen.dart';
import 'package:provider/provider.dart';
import '../../core/components/common_button.dart';
import '../../core/components/placeholders.dart';
import '../../core/components/profile_service_field.dart';
import '../../core/constants/styles.dart';
import '../../core/helper/navigateable.dart';
import '../../core/providers/app_providers/screen_provider.dart';
import '../../core/routes/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SystemScreen extends StatefulWidget implements Navigateable {
  @override
  String getName() {
    return Routes.system;
  }

  @override
  _SystemScreenState createState() => _SystemScreenState();
}

class _SystemScreenState extends State<SystemScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Color? iconColor;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: height * 2.2,
              backgroundImage: AssetImage("assets/image/png/mini_avatar.png"),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Привет Стас',
                  style: TextStyle(
                    color: Styles.k_black_color,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Алматы, Казахстан',
                  style: TextStyle(
                    color: Styles.k_black_color,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/image/svg/menu_with_notification.svg",
              width: width * 7.62,
              height: height * 3.55,
            ),
            iconSize: height * 3.55,
            color: Styles.k_black_color,
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
        elevation: 0.0,
        toolbarHeight: height * 7.1,
        titleSpacing: 15,
        automaticallyImplyLeading: false,
        backgroundColor: Styles.k_white_color,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Styles.k_border_primary_color,
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(23),
          ),
        ),
      ),
      endDrawer: SafeArea(
        top: true,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23),
              bottomLeft: Radius.circular(23),
            ),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: width * 4.10, right: width * 4.10),
          width: width * 82,
          height: height * 100,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                // padding: EdgeInsets.only(top: height * 7.1),
                // height: height * 13.5,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/image/png/mini_avatar.png"),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'Стас Филькин',
                              style: TextStyle(
                                color: Styles.k_black_color,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.edit_profile);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(50, 20),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Редактировать профиль',
                              style: TextStyle(
                                color: Styles.k_main_color,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.1,
                color: Styles.k_black_color,
                height: height * 3.79,
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProfileServicesField(
                          'assets/image/svg/service/search_symptoms.svg',
                          Icons.keyboard_arrow_right_rounded,
                          'Поиск по симптомам',
                          true,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.change_pass);
                          },
                        ),
                        ProfileServicesField(
                          'assets/image/svg/service/doctor_search.svg',
                          Icons.keyboard_arrow_right_rounded,
                          'Поиск врачей',
                          true,
                          onTap: () {
                            Provider.of<ScreenProvider>(context, listen: false)
                                .setCurrentWidgetToDoctor();
                            _scaffoldKey.currentState!.closeEndDrawer();
                          },
                        ),
                        ProfileServicesField(
                          'assets/image/svg/service/prevention.svg',
                          Icons.keyboard_arrow_right_rounded,
                          'Профилактика',
                          true,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.change_pass);
                          },
                        ),
                        ProfileServicesField(
                          'assets/image/svg/service/calendar.svg',
                          Icons.keyboard_arrow_right_rounded,
                          'Календарь',
                          true,
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.calendar_screen);
                          },
                        ),
                        ProfileServicesField(
                          'assets/image/svg/service/scrinning.svg',
                          Icons.keyboard_arrow_right_rounded,
                          'Скриннинг',
                          true,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.change_pass);
                          },
                        ),
                        ProfileServicesField(
                          'assets/image/svg/service/bad_habits.svg',
                          Icons.keyboard_arrow_right_rounded,
                          'Вредные привычки',
                          true,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.change_pass);
                          },
                        ),
                        ProfileServicesField(
                          'assets/image/svg/service/vaccine.svg',
                          Icons.keyboard_arrow_right_rounded,
                          'Вакцинация',
                          true,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.change_pass);
                          },
                        ),
                        ProfileServicesField(
                          'assets/image/svg/service/weight.svg',
                          Icons.keyboard_arrow_right_rounded,
                          'Индекс массы тела',
                          true,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.change_pass);
                          },
                        ),
                        ProfileServicesField(
                          'assets/image/svg/service/movement.svg',
                          Icons.keyboard_arrow_right_rounded,
                          'Статистика подвижности',
                          true,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.change_pass);
                          },
                        ),
                        ProfileServicesField(
                          'assets/image/svg/service/sleep.svg',
                          Icons.keyboard_arrow_right_rounded,
                          'Статистика сна',
                          true,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.change_pass);
                          },
                        ),
                        ProfileServicesField(
                          'assets/image/svg/service/archive.svg',
                          Icons.keyboard_arrow_right_rounded,
                          'Архив',
                          true,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.change_pass);
                          },
                        ),
                        ProfileServicesField(
                          'assets/image/svg/service/settings.svg',
                          Icons.keyboard_arrow_right_rounded,
                          'Настройки',
                          true,
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.profile_settings_screen);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 0.1,
                color: Styles.k_black_color,
                height: 0,
              ),
              CommonButton(
                margin:
                    EdgeInsets.only(bottom: height * 3.79, top: height * 1.9),
                child: Text('Выйти'),
                backgroundColor: Colors.transparent,
                foregroundColor: Styles.k_border_red_color,
                borderColor: true,
                onPressed: () {
                  showAlertDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Provider.of<ScreenProvider>(context).selectedWidget,
      bottomNavigationBar: Container(
        height: height * 11.37,
        decoration: const BoxDecoration(
          color: Styles.k_white_color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          border: Border.fromBorderSide(
            BorderSide(
              color: Styles.k_border_primary_color,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  Provider.of<ScreenProvider>(context, listen: false)
                      .setSelectedIndex(0);
                });
              },
              icon: Provider.of<ScreenProvider>(context, listen: false)
                          .selectedIndex ==
                      0
                  ? SvgPicture.asset(
                      'assets/image/svg/navbar/health_active.svg',
                      width: width * 11.794,
                      height: height * 5.45,
                    )
                  : SvgPicture.asset(
                      'assets/image/svg/navbar/health.svg',
                      width: width * 11.794,
                      height: height * 5.45,
                    ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  Provider.of<ScreenProvider>(context, listen: false)
                      .setSelectedIndex(1);
                });
              },
              icon: Provider.of<ScreenProvider>(context, listen: false)
                          .selectedIndex ==
                      1
                  ? SvgPicture.asset(
                      'assets/image/svg/navbar/search_active.svg',
                      width: width * 11.794,
                      height: height * 5.45,
                    )
                  : SvgPicture.asset(
                      'assets/image/svg/navbar/search.svg',
                      width: width * 11.794,
                      height: height * 5.45,
                    ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  Provider.of<ScreenProvider>(context, listen: false)
                      .setSelectedIndex(2);
                });
              },
              icon: Provider.of<ScreenProvider>(context, listen: false)
                          .selectedIndex ==
                      2
                  ? SvgPicture.asset(
                      'assets/image/svg/navbar/doctor.svg',
                      width: width * 11.794,
                      height: height * 5.45,
                    )
                  : SvgPicture.asset(
                      'assets/image/svg/navbar/doctor_active.svg',
                      width: width * 11.794,
                      height: height * 5.45,
                    ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  Provider.of<ScreenProvider>(context, listen: false)
                      .setSelectedIndex(3);
                });
              },
              icon: Provider.of<ScreenProvider>(context, listen: false)
                          .selectedIndex ==
                      3
                  ? SvgPicture.asset(
                      'assets/image/svg/navbar/profile_active.svg',
                      width: width * 11.794,
                      height: height * 5.45,
                    )
                  : SvgPicture.asset(
                      'assets/image/svg/navbar/profile.svg',
                      width: width * 11.794,
                      height: height * 5.45,
                    ),
            ),
          ],
        ),
      ),
      // Container(
      //   decoration: BoxDecoration(
      //     // borderRadius: BorderRadius.only(
      //     //   topRight: Radius.circular(30),
      //     //   topLeft: Radius.circular(30),
      //     // ),
      //     // boxShadow: [
      //     //   BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
      //     // ],
      //     border: Border(
      //       top: BorderSide(
      //         color: Styles.k_border_primary_color,
      //       ),
      //     ),
      //     //shape: BoxShape.circle,
      //   ),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(30.0),
      //       topRight: Radius.circular(30.0),
      //     ),
      //     child: BottomNavigationBar(
      //       backgroundColor: Styles.k_white_color,
      //       showUnselectedLabels: false,
      //       showSelectedLabels: false,
      //       elevation: 0.0,
      //       onTap: (int index) {
      //         Provider.of<ScreenProvider>(context, listen: false)
      //             .setSelectedIndex(index);
      //       },
      //       items: [
      //         BottomNavigationBarItem(
      //           icon: SvgPicture.asset(
      //             'assets/image/svg/navbar/health.svg',
      //             width: 46,
      //             height: 46,
      //           ),
      //           activeIcon: SvgPicture.asset(
      //             'assets/image/svg/navbar/health_active.svg',
      //             width: 46,
      //             height: 46,
      //           ),
      //           label: "",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: SvgPicture.asset(
      //             'assets/image/svg/navbar/search.svg',
      //             width: 46,
      //             height: 46,
      //           ),
      //           activeIcon: SvgPicture.asset(
      //             'assets/image/svg/navbar/search_active.svg',
      //             width: 46,
      //             height: 46,
      //           ),
      //           label: "",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: SvgPicture.asset(
      //             'assets/image/svg/navbar/doctor.svg',
      //             fit: BoxFit.contain,
      //             width: 46,
      //             height: 46,
      //           ),
      //           activeIcon: SvgPicture.asset(
      //             'assets/image/svg/navbar/doctor_active.svg',
      //             width: 46,
      //             height: 46,
      //           ),
      //           label: "",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: SvgPicture.asset(
      //             'assets/image/svg/navbar/profile.svg',
      //             width: 46,
      //             height: 46,
      //           ),
      //           activeIcon: SvgPicture.asset(
      //             'assets/image/svg/navbar/profile_active.svg',
      //             width: 46,
      //             height: 46,
      //           ),
      //           label: "",
      //         ),
      //       ],
      //       currentIndex: Provider.of<ScreenProvider>(context).selectedIndex,
      //       type: BottomNavigationBarType.fixed,
      //     ),
      //   ),
      // ),
    );
  }
}
