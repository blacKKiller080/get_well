import 'package:flutter/material.dart';
import 'package:get_well/core/components/placeholders.dart';
import 'package:get_well/core/helper/navigateable.dart';
import '../../../core/components/common_button.dart';
import '../../../core/components/profile_service_field.dart';
import '../../../core/constants/styles.dart';
import '../../../core/routes/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSettingsScreen extends StatefulWidget implements Navigateable {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();

  @override
  String getName() {
    return Routes.profile_settings_screen;
  }
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.k_border_secondary_color,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                CircleAvatar(
                  radius: height * 2.2,
                  backgroundImage:
                      AssetImage("assets/image/png/mini_avatar.png"),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/image/svg/camera_on.svg"),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Стас',
                  style: TextStyle(
                    color: Styles.k_black_color,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'мне 3 года',
                  style: TextStyle(
                      color: Styles.k_black_color,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon:
                SvgPicture.asset('assets/image/svg/pen_with_notification.svg'),
            iconSize: height * 3.55,
            color: Styles.k_black_color,
            onPressed: () {},
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
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(
            left: width * 4.1,
            right: width * 4.1,
            top: height * 1.42,
            bottom: 0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 4.10,
                vertical: height * 1.9,
              ),
              decoration: BoxDecoration(
                color: Styles.k_white_color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileServicesField(
                    'assets/image/svg/questionnaire.svg',
                    Icons.keyboard_arrow_right_rounded,
                    'Поменять анкету',
                    false,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.edit_profile);
                    },
                  ),
                  Divider(
                    height: height * 2.8,
                    thickness: 1,
                  ),
                  ProfileServicesField(
                    'assets/image/svg/lock.svg',
                    Icons.keyboard_arrow_right_rounded,
                    'Поменять пароль',
                    false,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.change_pass);
                    },
                  ),
                  Divider(
                    height: height * 2.8,
                    thickness: 1,
                  ),
                  ProfileServicesField(
                    'assets/image/svg/notifications.svg',
                    Icons.keyboard_arrow_right_rounded,
                    'Уведомления',
                    false,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.notification_screen);
                    },
                  ),
                  Divider(
                    height: height * 2.8,
                    thickness: 1,
                  ),
                  ProfileServicesField(
                    'assets/image/svg/faq.svg',
                    Icons.keyboard_arrow_right_rounded,
                    'FAQ',
                    false,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.faq_screen);
                    },
                  ),
                  Divider(
                    height: height * 2.8,
                    thickness: 1,
                  ),
                  ProfileServicesField(
                    'assets/image/svg/privacy_policy.svg',
                    Icons.keyboard_arrow_right_rounded,
                    'Политка конфидициальности',
                    false,
                    onTap: () {
                      Navigator.pushNamed(
                          context, Routes.privacy_policy_screen);
                    },
                  ),
                ],
              ),
            ),
            CommonButton(
              margin: EdgeInsets.only(top: height * 1.9),
              child: Text('Отмена'),
              backgroundColor: Colors.transparent,
              foregroundColor: Styles.k_main_color,
              borderColor: true,
              radius: 16,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CommonButton(
              margin: EdgeInsets.only(top: height * 1.9),
              child: Text(
                'Выйти',
                style: TextStyle(letterSpacing: 1),
              ),
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
      ),
    );
  }
}
