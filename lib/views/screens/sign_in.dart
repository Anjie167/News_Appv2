import 'dart:ui';
import 'package:api_task/views/components/already_have_an_account_check.dart';
import 'package:api_task/views/components/rounded_button.dart';
import 'package:api_task/views/components/rounded_input_field.dart';
import 'package:api_task/views/components/rounded_password_field.dart';
import 'package:api_task/views/components/or_divider.dart';
import 'package:api_task/views/components/social_icon.dart';
import 'package:api_task/views/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('images/background.jpg'),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  const Text(
                    'welcome!!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: size.height * 0.6,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue[900]),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    RoundedInputField(
                        hintText: 'Email:', onChanged: (value) {}),
                    RoundedPasswordField(
                        hintText: 'Password:', onChanged: (value) {}),
                    RoundedButton(text: 'Sign in', press: () {}),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {},
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        )
                      ],
                    ),
                    const OrDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialIcon(icon: FontAwesomeIcons.google, press: () {}),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        SocialIcon(
                            icon: FontAwesomeIcons.facebook, press: () {})
                      ],
                    ),
                    const Spacer(),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUpPage();
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
