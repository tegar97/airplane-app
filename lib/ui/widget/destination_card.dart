import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/detail_pages.dart';
import 'package:flutter/material.dart';

class DestinationCard extends StatelessWidget {
  final DestinationModel destinations;

  const DestinationCard(
    this.destinations,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage(destinations)));
      },
      child: Container(
        width: 200,
        height: 323,
        margin: EdgeInsets.only(left: defaultMargin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(image: NetworkImage(destinations.imageUrl))),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(18))),
                  child: Row(
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
                      Text(destinations.rating.toString(),
                          style: blackTextStyle.copyWith(fontWeight: medium))
                    ],
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destinations.name,
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(destinations.city, style: greyTextStyle.copyWith(fontWeight: light))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
