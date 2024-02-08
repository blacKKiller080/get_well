import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileServicesField extends StatelessWidget {
  String leftIcon;
  IconData rightIcon;
  String data;
  void Function()? onTap;
  bool onDrawer;

  ProfileServicesField(this.leftIcon, this.rightIcon, this.data, this.onDrawer,
      {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
        margin: EdgeInsets.only(
            bottom:
                onDrawer ? MediaQuery.of(context).size.height / 100 * 1.9 : 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 8,
              child: Row(
                children: [
                  SvgPicture.asset(
                    leftIcon,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Text(
                      data,
                      style: Theme.of(context).textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                rightIcon,
              ),
            )
          ],
        ),
      ),
    );
  }
}
