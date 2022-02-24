import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:peritosapp/core/auth/provider/auth_provider.dart';
import 'package:peritosapp/shared/widget/text_frave.dart';

class LoginScreen extends ConsumerWidget {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    /*  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        statusBarIconBrightness: Brightness.dark // dark text for status bar
        )); */
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: SingleChildScrollView(
          reverse: true,
          child: Form(
            child: Column(children: [
              SizedBox(
                height: 50.h,
              ),
              Image.asset(
                "assets/images/logo/logo_allemant1.png",
                /* height: 125.h,
                    width: double.infinity, */
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                /* child: StreamBuilder(
                    stream: ref.watch(authProvider.notifier).userStream,
                    builder: (context, snapshot) =>  */
                child: TextFormField(
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  controller: _userController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    /* errorText:
                            snapshot.hasError ? snapshot.error?.toString() : "", */

                    labelText: "Usuario",
                    labelStyle: TextStyle(
                      fontSize: 14,
                    ),
                    /* 
                            filled: true,
                            fillColor: Color(0xfff3f4f6), 
                            
                            border: OutlineInputBorder(borderSide: BorderSide.none),
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),*/
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFF114472), width: 1.2),
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF114472), width: 1.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF114472)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF114472)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Ingrese su usuario',
                    hintStyle: const TextStyle(color: Color(0xFF114472)),
                    prefixIcon: const Icon(
                      Iconsax.user,
                      color: Color(0xFF114472),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                // height: 40,
                /*                     margin: const EdgeInsets.symmetric(horizontal: 16),
               */
                child: /* StreamBuilder(
                    builder: (context, snapshot) =>  */
                    TextFormField(
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        maxLines: 1,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          /* errorText:
                              snapshot.hasError ? snapshot.error?.toString() : "", */
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          /*                           errorText: _errorText,
                       */
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFF114472), width: 1.2),
                              borderRadius: BorderRadius.circular(10.0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFF114472), width: 1.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF114472)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF114472)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Ingrese su contraseña',
                          hintStyle: const TextStyle(color: Color(0xFF114472)),
                          prefixIcon: const Icon(
                            Iconsax.key,
                            color: Color(0xFF114472),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        )),
              ),
              SizedBox(
                height: 15.h,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextFrave(
                      text: 'Forgot Password?', color: Color(0xFF114472))),
              SizedBox(
                height: 20.h,
              ),
              _widgetSignInButton(context, ref)
              /*  GestureDetector(
                    onTap: () {
                      /*   var isValidPassword = ref
                          .watch(authProvider.notifier)
                          .isValidPassword(_passwordController.text);
                      var isValidUser = ref
                          .watch(authProvider.notifier)
                          .isValidUser(_userController.text);
                      if (isValidPassword && isValidUser) { }*/
                      ref.read(authProvider.notifier).login(
                          _userController.text, _passwordController.text);
                    },
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFF114472)),
                      child: Center(
                        child: Text(
                          "Iniciar sesion",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ), */
            ]),
          ),
        ),
      ),
    );
  }

  Widget _widgetShimmer(BuildContext context, WidgetRef ref) {
    return Container();
  }

  Widget _widgetSignInButton(BuildContext context, WidgetRef ref) {
    final cashCounterProvider = ref.read(authProvider.notifier);

    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            cashCounterProvider.login(
                _userController.text, _passwordController.text);
          },
          child: Text('Iniciar Sesión'),
        ));
  }

  Widget _widgetSignUpButton(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            /* context.router.push(RegisterScreen()); */
          },
          child: Text('Registarse'),
        ));
  }
}
