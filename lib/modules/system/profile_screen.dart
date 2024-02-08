import 'package:flutter/material.dart';
import 'package:get_well/core/components/placeholders.dart';
import 'package:get_well/core/helper/navigateable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/components/common_button.dart';
import '../../core/components/profile_service_field.dart';
import '../../../core/constants/styles.dart';

import '../../../core/routes/routes.dart';

class ProfileScreen extends StatefulWidget implements Navigateable {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

  @override
  String getName() {
    return Routes.profile_screen;
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.k_border_secondary_color,
      body: SafeArea(
        child: Container(
          height: height * 100, // or double.infinity
          margin: EdgeInsets.only(
              left: width * 4.1,
              right: width * 4.1,
              top: height * 1.42,
              bottom: 0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: height * 7.82,
                        backgroundImage:
                            AssetImage("assets/image/png/avatar.png"),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        bottom: 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/image/svg/edit_avatar_camera.svg",
                            width: width * 10.5,
                            height: height * 3.9,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 1.9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Стас, 13 лет',
                        style: TextStyle(
                          color: Styles.k_black_color,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.edit_profile);
                        },
                        icon: SvgPicture.asset(
                          "assets/image/svg/pen.svg",
                          width: width * 4.62,
                          height: height * 2.13,
                          color: Color(0xFFCDCDCD),
                        ),
                        padding: EdgeInsets.only(left: width * 1.87),
                        constraints: BoxConstraints(),
                      ),
                    ],
                  ),
                  //Friends
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: height * 2.37),
                          child: Text(
                            'Список близких',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Styles.k_black_color,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            physics: BouncingScrollPhysics(),
                            children: [
                              Column(
                                children: [
                                  listTileWidget(context),
                                  listTileWidget(context),
                                  listTileWidget(context),
                                  listTileWidget(context),
                                  listTileWidget(context),
                                  listTileWidget(context),
                                  listTileWidget(context),
                                  listTileWidget(context),
                                ],
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Добавить',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Styles.k_main_color,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: height * 47,
                    margin: EdgeInsets.only(top: height * 1.9),
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 5.64,
                      vertical: height * 2.6,
                    ),
                    decoration: BoxDecoration(
                      color: Styles.k_white_color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(22),
                      ),
                    ),
                  ),
                  //Archive
                  Container(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: height * 2),
                              width: width * 100,
                              child: Text(
                                'Архив',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Styles.k_black_color,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            archiveField("Анализ МРТ", false, context),
                            archiveField("Анализ МРТ", false, context),
                            archiveField("Анализ МРТ", false, context),
                            archiveField("Анализ МРТ", false, context),
                            archiveField("Анализ МРТ", false, context),
                            archiveField("Анализ МРТ", false, context),
                          ],
                        ),
                      ],
                    ),
                    height: height * 18.6,
                    margin: EdgeInsets.only(top: height * 1.9),
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 5.64, vertical: height * 2.6),
                    decoration: BoxDecoration(
                      color: Styles.k_white_color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(22),
                      ),
                    ),
                  ),
                  CommonButton(
                    margin: EdgeInsets.only(
                        bottom: height * 1.9, top: height * 1.9),
                    child: const Text('Выйти'),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Styles.k_border_red_color,
                    borderColor: true,
                    radius: 16,
                    onPressed: () {
                      showAlertDialog(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
