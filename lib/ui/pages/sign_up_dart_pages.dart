import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/custom_botton.dart';
import 'package:airplane/ui/widget/custum_text_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Join us and get\nyour next journey',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget InputSection() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Column(
          children: [
            CustumTextFormField(title: 'Full Name', hintText: 'Your full name'),
            CustumTextFormField(
                title: 'Email Address', hintText: 'Your email adress'),
            CustumTextFormField(
              title: 'password',
              hintText: 'Your password',
              obsecure: true,
            ),
            CustumTextFormField(title: 'Hobby', hintText: 'Your Hobby'),
            SizedBox(height: 20),
            CustomButton(
              title: 'Get Started',
              width: 220,
              onPressed: () {
                Navigator.pushNamed(context, '/bonus');
              },
            ),
          ],
        ),
      );
    }

    Widget tacButton() {
      return Container(
          alignment: Alignment.center,
          child: Text('Terms and Conditions',
              style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                  decoration: TextDecoration.underline)),
          margin: EdgeInsets.only(top: 50, bottom: 73));
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [title(), InputSection(), tacButton()],
        ),
      ),
    );
  }
}
