import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_well/core/helper/modal_helper.dart';
import '../../../core/blocs/authorization/authorization_bloc.dart';
import '../../../core/blocs/user/user_bloc.dart';
import '../../../core/components/common_button.dart';
import '../../../core/components/common_input.dart';
import '../../../core/components/placeholders.dart';
import '../../../core/constants/styles.dart';
import '../../../core/helper/navigateable.dart';
import '../../../core/routes/routes.dart';
import '../registration/registration_screen.dart';

class LoginScreen extends StatefulWidget implements Navigateable {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  String getName() {
    return Routes.login;
  }
}
        
class _LoginScreenState extends State<LoginScreen> with ModalHelper {
  late AuthorizationBloc _bloc;

  var loginTextController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthorizationBloc>();
    // PhoneInputFormatter.replacePhoneMask(countryCode: 'KZ', newMask: '+0 (000) 000 00 00');
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        // margin: EdgeInsets.all(25),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(_createRoute());
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: height * 26.06,
                    bottom: height * 4.74,
                  ),
                  child: Image.asset(
                    'assets/image/png/logo_mini.png',
                    height: height * 9.83,
                    width: width * 34.36,
                  ),
                ),
              ),
              CommonInput(
                //"${height},  ${MediaQuery.of(context).size.aspectRatio}",
                "Логин",
                margin: EdgeInsets.only(
                  bottom: height * 1.89,
                  left: width * 6.41,
                  right: width * 6.41,
                ),
                type: InputType.TEXT,
                fontWeight: FontWeight.w600,
                controller: loginTextController,
                customColor: Styles.k_tertiary_disabled,
                borderColor: Styles.k_tertiary_disabled,
                textInputAction: TextInputAction.next,
                contentPaddingHorizontal: 7.69,
              ),
              CommonInput(
                // "${width}",
                "Пароль",
                margin: EdgeInsets.only(
                  bottom: height * 1.89,
                  left: width * 6.41,
                  right: width * 6.41,
                ),
                type: InputType.PASSWORD,
                customColor: Styles.k_tertiary_disabled,
                borderColor: Styles.k_tertiary_disabled,
                controller: passwordController,
                textInputAction: TextInputAction.done,
                contentPaddingHorizontal: 7.69,
              ),
              BlocConsumer<AuthorizationBloc, AuthorizationState>(
                bloc: _bloc,
                listener: (context, state) {
                  if (state is LoginErrorState) {
                    return AlertController.showMessage(
                      context: context,
                      title: 'error',
                      content: state.error,
                    );
                  }
                  if (state is LoginLoadedState) {
                    context.read<UserBloc>().updateUser(state.user);
                    Navigator.pushReplacementNamed(context, Routes.system);
                  }

                  if (state is LoginErrorState) {
                    AlertController.showMessage(
                      context: context,
                      title: 'error',
                      content: state.error,
                    );
                  }
                  if (state is LoginLoadingState) {
                    //  EasyLoading();
                  }
                },
                builder: (context, state) {
                  final isLoading = state is LoginLoadingState;
                  return BlocBuilder<AuthorizationBloc, AuthorizationState>(
                      builder: (context, state) {
                    return state is LoginLoadingState
                        ? const CircularProgressIndicator()
                        : CommonButton(
                            child: Text('Войти'),
                            onPressed: () {
                              if (isLoading) return;
                              _bloc.login(loginTextController.text,
                                  passwordController.text);
                            },
                            margin: EdgeInsets.only(
                              bottom: height * 1.89,
                              left: width * 6.41,
                              right: width * 6.41,
                            ),
                          );
                  });
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Забыли пароль?',
                  style: TextStyle(
                      color: Styles.k_black_color, fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.new_pass_first);
                },
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: width * 10.25,
                      top: height * 20.97,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/image/png/google_icon.png',
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/image/png/facebook_icon.png',
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/image/png/twitter_icon.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CommonButton(
                      child: const Text(
                        'Регистрация',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      rightScreenButton: true,
                      onPressed: () {
                        Navigator.of(context).push(_createRoute());
                      },
                      margin: EdgeInsets.only(
                        left: width * 8.97,
                        top: height * 20.97,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future loginFirebase() async {
  //   try {
  //     final credential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(
  //       email: loginTextController.text,
  //       password: passwordController.text,
  //     )
  //         .then((value) {
  //       Navigator.pushNamed(context, Routes.system);
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text("No user found for that email")));
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text("Wrong password provided for that user")));
  //     }
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    loginTextController.dispose();
    passwordController.dispose();
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        RegistrationScreen(),
    transitionDuration: Duration(milliseconds: 500),
    reverseTransitionDuration: Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(3.0, 0.0);
      const end = Offset(0.0, 0.0);
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
