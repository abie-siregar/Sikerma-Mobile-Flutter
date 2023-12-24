import 'package:flutter/material.dart';
import 'package:sikerma/admin/dashboard.dart';
import 'package:sikerma/admin/mahasiswa.dart';
import 'package:sikerma/auth/register.dart';
import 'package:sikerma/components/my_textfield.dart';
import 'package:sikerma/components/my_button.dart';
import 'package:sikerma/components/my_button_register.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),

            //logo
            Image.asset('lib/images/Polibatam.png'),

            const SizedBox(height: 50),

            //text

            const SizedBox(
              height: 25,
            ),

            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // password textfield
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 10),

            // forgot password?
            MyButton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Dashboard()));
              },
            ),

            const SizedBox(height: 25),

            // sign in button
            MyButtonRegister(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Register()));
              },
            ),
          ],
        ),
      )),
    );
  }
}
