import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/common_button.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/helper/navigateable.dart';
import '../../../../../core/routes/routes.dart';

class NotificationScreen extends StatefulWidget implements Navigateable {
  @override
  String getName() {
    return Routes.notification_screen;
  }

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with WidgetsBindingObserver {
  // late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  bool notificationPermission = false;
  bool soundPermission = false;
  bool popUpNotifications = false;
  String? mtoken = " ";

  @override
  void initState() {
    super.initState();
    // requestPermission();
  }

  // void getToken() async {
  //   await FirebaseMessaging.instance.getToken().then((token) {
  //     setState(
  //       () {
  //         mtoken = token;
  //         print("My token is $mtoken");
  //       },
  //     );
  //   });
  // }

  // initInfo() {
  //   var androidInitialize =
  //       const AndroidInitializationSettings('mimpmap/ic_launcher');
  //   var iOSInitialize = const IOSInitializationSettings();
  //   var initializationSettings =
  //       InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
  //   flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onSelectNotification: (String? payload) async {
  //         try{
  //           if(payload != null && payload.isNotEmpty){
  //           }else{
  //           }
  //         }catch (e){
  //         }
  //         return;
  //       });
  // }

  // void requestPermission() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   NotificationSettings settings = await messaging.requestPermission(
  //     alert: notificationPermission,
  //     announcement: false,
  //     badge: notificationPermission,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: soundPermission,
  //   );
  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     print('User granted permission');
  //   } else if (settings.authorizationStatus ==
  //       AuthorizationStatus.provisional) {
  //     print('User granted provisional permission');
  //   } else {
  //     print('User declined or has not accepted permission');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.k_border_secondary_color,
      appBar: AppBar(
        title: Text('Уведомления'),
        titleTextStyle: TextStyle(
            color: Styles.k_black_color,
            fontSize: 20,
            fontWeight: FontWeight.w700),
        centerTitle: true,
        backgroundColor: Styles.k_white_color,
        toolbarHeight: height * 7.1,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Styles.k_border_primary_color,
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(23),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 100 * 1.9,
              horizontal: MediaQuery.of(context).size.width / 100 * 4.1),
          child: Center(
            child: Column(
              children: [
                notificationFields(
                  "Разрешить уведомления",
                  CupertinoSwitch(
                    activeColor: Styles.k_main_color,
                    thumbColor: Styles.k_white_color,
                    trackColor: Colors.black12,
                    value: notificationPermission,
                    onChanged: ((value) {
                      setState(() {
                        notificationPermission = value;
                      });
                    }),
                  ),
                ),
                notificationFields(
                  "Звука при уведомлении",
                  CupertinoSwitch(
                    activeColor: Styles.k_main_color,
                    thumbColor: Styles.k_white_color,
                    trackColor: Colors.black12,
                    value: soundPermission,
                    onChanged: ((value) {
                      setState(() {
                        soundPermission = value;
                      });
                    }),
                  ),
                ),
                notificationFields(
                  "Разрешить всплывающие уведомления",
                  CupertinoSwitch(
                    activeColor: Styles.k_main_color,
                    thumbColor: Styles.k_white_color,
                    trackColor: Colors.black12,
                    value: popUpNotifications,
                    onChanged: ((value) {
                      setState(() {
                        popUpNotifications = value;
                      });
                    }),
                  ),
                ),
                notificationFields(
                  "Разрешить всплывающие уведомления",
                  CupertinoSwitch(
                    activeColor: Styles.k_main_color,
                    thumbColor: Styles.k_white_color,
                    trackColor: Colors.black12,
                    value: popUpNotifications,
                    onChanged: ((value) {
                      setState(() {
                        popUpNotifications = value;
                      });
                    }),
                  ),
                ),
                notificationFields(
                  "Разрешить всплывающие уведомления",
                  CupertinoSwitch(
                    activeColor: Styles.k_main_color,
                    thumbColor: Styles.k_white_color,
                    trackColor: Colors.black12,
                    value: popUpNotifications,
                    onChanged: ((value) {
                      setState(() {
                        popUpNotifications = value;
                      });
                    }),
                  ),
                ),
                CommonButton(
                  child: Text('Сохранить'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget notificationFields(String data, CupertinoSwitch cupertinoSwitch) =>
      Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 100 * 1.42,
            horizontal: MediaQuery.of(context).size.width / 100 * 4.1),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height / 100 * 1.9),
        decoration: BoxDecoration(
            color: Styles.k_white_color,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                data,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            cupertinoSwitch,
          ],
        ),
      );
}





//  late Future<String> permissionStatusFuture;

//   var permGranted = "granted";
//   var permDenied = "denied";
//   var permUnknown = "unknown";
//   var permProvisional = "provisional";

//   @override
//   void initState() {
//     super.initState();
//     // set up the notification permissions class
//     // set up the future to fetch the notification data
//     permissionStatusFuture = getCheckNotificationPermStatus();
//     // With this, we will be able to check if the permission is granted or not
//     // when returning to the application
//     WidgetsBinding.instance.addObserver(this);
//   }

//   /// When the application has a resumed status, check for the permission
//   /// status
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed) {
//       setState(() {
//         permissionStatusFuture = getCheckNotificationPermStatus();
//       });
//     }
//   }

//   /// Checks the notification permission status
//   Future<String> getCheckNotificationPermStatus() {
//     return NotificationPermissions.getNotificationPermissionStatus()
//         .then((status) {
//       switch (status) {
//         case PermissionStatus.denied:
//           return permDenied;
//         case PermissionStatus.granted:
//           return permGranted;
//         case PermissionStatus.unknown:
//           return permUnknown;
//         case PermissionStatus.provisional:
//           return permProvisional;
//         default:
//           return "";
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Notification Permissions'),
//         ),
//         body: Center(
//             child: Container(
//           margin: EdgeInsets.all(20),
//           child: FutureBuilder(
//             future: permissionStatusFuture,
//             builder: (context, snapshot) {
//               // if we are waiting for data, show a progress indicator
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               }

//               if (snapshot.hasError) {
//                 return Text('error while retrieving status: ${snapshot.error}');
//               }

//               if (snapshot.hasData) {
//                 var textWidget = Text(
//                   "The permission status is ${snapshot.data}",
//                   style: TextStyle(fontSize: 20),
//                   softWrap: true,
//                   textAlign: TextAlign.center,
//                 );
//                 // The permission is granted, then just show the text
//                 if (snapshot.data == permGranted) {
//                   return textWidget;
//                 }

//                 // else, we'll show a button to ask for the permissions
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     textWidget,
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextButton(
//                       child: Text("Ask for notification status".toUpperCase()),
//                       onPressed: () {
//                         // show the dialog/open settings screen
//                         NotificationPermissions.requestNotificationPermissions(
//                                 iosSettings: const NotificationSettingsIos(
//                                     sound: true, badge: true, alert: true))
//                             .then((_) {
//                           // when finished, check the permission status
//                           setState(() {
//                             permissionStatusFuture =
//                                 getCheckNotificationPermStatus();
//                           });
//                         });
//                       },
//                     )
//                   ],
//                 );
//               }
//               return Text("No permission status yet");
//             },
//           ),
//         )),
//       ),
//     );
//   }
// }
