import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destinations_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/destination_card.dart';
import 'package:airplane/ui/widget/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationsCubit>().fetchDestinations();
    super.initState();
  }

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

  Widget popularDestinations(List<DestinationModel> destinations) {
    return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: destinations.map((DestinationModel destination) {
            return DestinationCard(destination);
          }).toList()),
        ));
  }

  Widget newDestinations(List<DestinationModel> destinations) {
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
          Column(
            children: destinations.map((DestinationModel destination) {
                return DestinationTile(destination);
            },
          ).toList()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DestinationsCubit, DestinationsState>(
      listener: (context, state) {
        // TODO: implement listener

        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: kRedColor, content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              header(),
              popularDestinations(state.destinations),
              newDestinations(state.destinations)
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
