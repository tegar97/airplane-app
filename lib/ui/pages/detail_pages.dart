import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/choose_set_pages.dart';
import 'package:airplane/ui/widget/custom_botton.dart';
import 'package:airplane/ui/widget/interest_item.dart';
import 'package:airplane/ui/widget/photo_item.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: const BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: const AssetImage(
                  'assets/image_destination1.png',
                ))),
      );
    }

    Widget customShadow() {
      return Container(
        height: 214,
        margin: EdgeInsets.only(top: 236),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95)
            ])),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            Container(
              width: 108,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icon_emblem.png')),
              ),
            ),

            // Note : Title
            Container(
              margin: EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lake Ciliwung',
                          style: whiteTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Tangerang',
                          style: whiteTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/icon_star.png'))),
                      ),
                      Text('4.5',
                          style: whiteTextStyle.copyWith(fontWeight: medium))
                    ],
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Note About
                  Text('About',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold)),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: blackTextStyle.copyWith(height: 1.9),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text('Photos',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold)),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          PhotoItem(imageUrl: 'assets/image_photo1.png'),
                          PhotoItem(imageUrl: 'assets/image_photo2.png'),
                          PhotoItem(imageUrl: 'assets/image_photo3.png'),
                          PhotoItem(imageUrl: 'assets/image_photo2.png'),
                          PhotoItem(imageUrl: 'assets/image_photo3.png'),
                          PhotoItem(imageUrl: 'assets/image_photo3.png'),
                          PhotoItem(imageUrl: 'assets/image_photo3.png'),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text('Interest',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold)),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      InterestItem(
                        text: 'Kids Park',
                      ),
                      InterestItem(
                        text: 'Home Bridge',
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      InterestItem(
                        text: 'City Museum',
                      ),
                      InterestItem(
                        text: 'Central Mall',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //Note: Price & Book Button

            Container(
              margin: EdgeInsets.only(top: 30, bottom: 40),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IDR 2.500.000',
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: medium),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'per orang',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        )
                      ],
                    ),
                  ),

                  // Note : Book Button
                  CustomButton(
                      title: 'Book Now',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseSetPage()));
                      },
                      width: 170)
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [backgroundImage(), customShadow(), content()],
      ),
    ));
  }
}
