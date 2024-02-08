import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_well/core/blocs/get_bad_habits/bad_habits_bloc.dart';
import 'package:get_well/core/blocs/get_life_styles/life_styles_bloc.dart';
import 'package:get_well/core/providers/authorization/authorization_provider.dart';
import 'package:get_well/core/providers/app_providers/calendar_provider.dart';
import 'package:get_well/modules/auth/forgot_password/new_pass_first.dart';
import 'package:get_well/modules/auth/forgot_password/new_pass_second.dart';
import 'package:get_well/modules/auth/forgot_password/new_pass_third.dart';
import 'package:get_well/modules/auth/login/login_screen.dart';
import 'package:get_well/modules/auth/registration/final_registration.dart';
import 'package:get_well/modules/auth/registration/registration_screen.dart';
import 'package:get_well/modules/system/categories/doctor_screen.dart';
import 'package:get_well/modules/system/categories/doctors_list_screen.dart';
import 'package:get_well/modules/system/category_screen.dart';
import 'package:get_well/modules/system/drawer/calendar_screen.dart';
import 'package:get_well/modules/system/health_screen.dart';
import 'package:get_well/modules/system/drawer/service_pages/settings_pages/change_pass_screen.dart';
import 'package:get_well/modules/system/drawer/service_pages/settings_pages/edit_profile_screen.dart';
import 'package:get_well/modules/system/drawer/service_pages/settings_pages/faq_screen.dart';
import 'package:get_well/modules/system/drawer/service_pages/settings_pages/notification_screen.dart';
import 'package:get_well/modules/system/drawer/service_pages/settings_pages/privacy_policy_screen.dart';
import 'package:get_well/modules/system/drawer/profile_settings_screen.dart';
import 'package:get_well/modules/system/search_screen.dart';
import 'package:get_well/modules/system/system_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'core/blocs/authorization/authorization_bloc.dart';
import 'core/blocs/user/user_bloc.dart';
import 'core/providers/app_providers/screen_provider.dart';
import 'firebase_options.dart';
import 'core/constants/styles.dart';
import 'core/helper/navigateable.dart';
import 'core/routes/routes.dart';
import 'modules/auth/registration/registration_second.dart';
import 'modules/auth/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseMessaging.instance.getInitialMessage();

  //  try {
  //   final hasToken = (await LocalStorage().getToken().timeout(const Duration(seconds: 2))) != null;
  //   if (hasToken) {
  //     screen = const NavBarTest();
  //   }
  // } catch (e) {
  //   debugPrint('Error occured in main.dart: $e');
  //   await LocalStorage().resetStorage();
  //   screen = BlocProvider(
  //     create: (_) => AuthorizationBloc(),
  //     child: const LoginScreen(),
  //   );
  // }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authorization_provider = AuthorizationProvider();
    return RepositoryProvider(
      create: (context) => AuthorizationProvider(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BadHabitsBloc>(
            create: (_) => BadHabitsBloc(authorization_provider),
          ),
          BlocProvider<LifeStylesBloc>(
            create: (_) => LifeStylesBloc(authorization_provider),
          ),
          BlocProvider<UserBloc>(
            create: (_) => UserBloc(),
          ),
          BlocProvider<AuthorizationBloc>(
            create: (_) => AuthorizationBloc(),
          ),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<ScreenProvider>(
              create: (_) => ScreenProvider(),
            ),
            ChangeNotifierProvider<CalendarProvider>(
              create: (_) => CalendarProvider(),
            ),
          ],
          child: MaterialApp(
            initialRoute: Routes.splash,
            routes: routes(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Gilroy',
              textTheme: TextTheme(
                displayMedium: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Styles.k_black_color,
                ),
                labelMedium: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Styles.k_text_secondary_color,
                ),
              ),
              backgroundColor: Styles.k_backgroung_color,
            ),
          ),
        ),
      ),
    );
  }
}

routes() {
  List<Navigateable> screens = generateRoutes();
  Map<String, Widget Function(BuildContext)> routes = {};
  screens.forEach((element) {
    routes[element.getName()] = (context) => element;
  });
  return routes;
}

List<Navigateable> generateRoutes() {
  return [
    SplashScreen(),
    SystemScreen(),
    LoginScreen(),
    RegistrationScreen(),
    RegistrationSecond(),
    FinalRegistration(),
    ProfileSettingsScreen(),
    EditProfileScreen(),
    ChangePasswordScreen(),
    NotificationScreen(),
    FAQScreen(),
    PrivacyPolicyScreen(),
    SearchScreen(),
    HealthScreen(),
    CategoryScreen(),
    DoctorListScreen(),
    DoctorScreen(),
    CalendarScreen(),
    NewPasswordFirst(),
    NewPasswordSecond(),
    NewPasswordThird(),
  ];
}
