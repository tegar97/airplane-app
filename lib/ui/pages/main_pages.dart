import 'package:airplane/ui/widget/custum_bottom_navigation.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  Widget custumBottomNavigation() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 60,
        margin: EdgeInsets.only(
            bottom: 30, left: defaultMargin, right: defaultMargin),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustumBottomNavigation(
                imageUrl: 'assets/icon_home.png', isSelected: true),
            CustumBottomNavigation(imageUrl: 'assets/icon_booking.png'),
            CustumBottomNavigation(imageUrl: 'assets/icon_card.png'),
            CustumBottomNavigation(imageUrl: 'assets/icon_settings.png'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [Text('Main Page2'), custumBottomNavigation()],
      ),
    );
  }
}
