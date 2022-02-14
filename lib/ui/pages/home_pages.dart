import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/destination_card.dart';
import 'package:airplane/ui/widget/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget header() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.only(
                left: defaultMargin, right: defaultMargin, top: 30),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Howdy,\n${state.user.name}',
                            style: blackTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: semiBold,
                                overflow: TextOverflow.ellipsis)),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Where to fly today?  ',
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: light),
                        )
                      ]),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/image_profile.png'),
                      )),
                )
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget popularDestinations() {
    return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DestinationCard(
                name: 'Lake ciliwung',
                city: 'Tanerang',
                imageUrl: 'assets/image_destination1.png',
                rating: 4.8,
              ),
              DestinationCard(
                name: 'White houses',
                city: 'Spain',
                imageUrl: 'assets/image_destination2.png',
                rating: 4.8,
              ),
              DestinationCard(
                name: 'Lake Ciliwung',
                city: 'Monaco',
                imageUrl: 'assets/image_destination3.png',
                rating: 4.8,
              ),
              DestinationCard(
                name: 'White houses',
                city: 'Japan',
                imageUrl: 'assets/image_destination4.png',
                rating: 4.8,
              ),
              DestinationCard(
                name: 'White houses',
                city: 'Singapore',
                imageUrl: 'assets/image_destination5.png',
                rating: 4.8,
              ),
            ],
          ),
        ));
  }

  Widget newDestinations() {
    return Container(
      margin: EdgeInsets.only(
          top: 30, left: defaultMargin, right: defaultMargin, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New this Year',
            style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
          ),
          const DestinationTile(
              name: 'Danau Beratan',
              city: 'Singaraja',
              imageUrl: 'assets/image_destination6.png',
              rating: 4.5),
          const DestinationTile(
              name: 'Sydney Opera',
              city: 'Australia',
              imageUrl: 'assets/image_destination7.png',
              rating: 4.5),
          const DestinationTile(
              name: 'Roma',
              city: 'Italy',
              imageUrl: 'assets/image_destination8.png',
              rating: 4.5),
          const DestinationTile(
              name: 'Payung teduh',
              city: 'Singapore',
              imageUrl: 'assets/image_destination1.png',
              rating: 4.5),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [header(), popularDestinations(), newDestinations()],
    );
  }
}
