import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_well/core/routes/routes.dart';

import '../constants/styles.dart';
import 'common_button.dart';

class DoctorListCard extends StatelessWidget {
  String image;
  void Function()? onTap;

  DoctorListCard(this.image, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.doctor_screen, arguments: image);
      },
      child: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/image/png/mini_avatar.png"),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Text(
                            'Евгений Плющенко',
                            style: TextStyle(
                                color: Styles.k_black_color,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      image,
                    ),
                    color: Styles.k_black_color,
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
              margin: EdgeInsets.only(bottom: 16),
            ),
            Container(
              padding: EdgeInsets.only(right: 15, left: 5),
              child: Text(
                'Стоматолог 75 летним стажем, работал в 44 странах мира. Удалил больше 10 000 лишних зубов, 180 000 поставленных пломб.',
                style: TextStyle(
                  color: Styles.k_black_color,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Styles.k_main_color,
                ),
                Text(
                  'Алматы ул. Панфилова дом 356',
                  style: TextStyle(
                    color: Styles.k_black_color,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    child: SvgPicture.asset(
                      "assets/image/svg/phone.svg",
                    ),
                    onPressed: () {},
                    margin: EdgeInsets.only(top: 8, right: 4),
                    backgroundColor: Styles.k_main_color,
                    foregroundColor: Styles.k_main_color,
                    contentPaddingVertical: 8,
                  ),
                ),
                Expanded(
                  child: CommonButton(
                    child: SvgPicture.asset("assets/image/svg/whatsapp.svg"),
                    onPressed: () {},
                    margin: EdgeInsets.only(top: 8, left: 4),
                    backgroundColor: Styles.k_green_color,
                    foregroundColor: Styles.k_white_color,
                    contentPaddingVertical: 8,
                  ),
                ),
              ],
            ),
          ],
        ),
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Styles.k_white_color,
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
        ),
      ),
    );
  }
}
