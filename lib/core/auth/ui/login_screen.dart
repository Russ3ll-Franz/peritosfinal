import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/core/auth/provider/auth_provider.dart';
import 'package:peritosapp/shared/route/app_router.gr.dart';

class LoginScreen extends ConsumerWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: <Widget>[
              const SizedBox(height: 150),
              Text(
                'Usuario',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Ingrese su Usuario',
                      ),
                      controller: _emailController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Ingrese su contraseña',
                      ),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const SizedBox(height: 30),
                          _widgetSignInButton(context, ref),
                          const SizedBox(height: 30),
                          Text(
                            'Nuevo Usuario',
                            textAlign: TextAlign.center,
                          ),
                        ]),
                  ],
                ),
              )
            ])));
  }

  Widget _widgetSignInButton(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            ref
                .read(authProvider.notifier)
                .login(_emailController.text, _passwordController.text);
          },
          child: Text('Iniciar Sesión'),
        ));
  }

  Widget _widgetSignUpButton(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            context.router.push(RegisterScreen());
            //context.navigateTo(SignUpWidget)
            //const SignUpWidget().show(context);
          },
          child: Text('Registarse'),
        ));
  }
}
