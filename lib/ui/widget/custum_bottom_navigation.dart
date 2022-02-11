import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustumBottomNavigation extends StatelessWidget {
  final String imageUrl;
  final bool isSelected;
  const CustumBottomNavigation(
      {Key? key, required this.imageUrl, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imageUrl))),
        ),
        Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
              color: isSelected ? kPrimaryColor : kWhiteColor,
              borderRadius: BorderRadius.circular(18)),
        )
      ],
    );
  }
}
