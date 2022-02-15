import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_pages.dart';
import 'package:airplane/ui/widget/custom_botton.dart';
import 'package:airplane/ui/widget/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSetPage extends StatelessWidget {
  final DestinationModel destinations;
  const ChooseSetPage(this.destinations,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_available.png'))),
            ),
            Text(
              'Available',
              style: blackTextStyle,
            ),
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_selected.png'))),
            ),
            Text(
              'Selected',
              style: blackTextStyle,
            ),
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_unavailable.png'))),
            ),
            Text(
              'Unavailable',
              style: blackTextStyle,
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: kWhiteColor),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text('A',
                            style: greyTextStyle.copyWith(fontSize: 16)),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text('B',
                            style: greyTextStyle.copyWith(fontSize: 16)),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text('',
                            style: greyTextStyle.copyWith(fontSize: 16)),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text('C',
                            style: greyTextStyle.copyWith(fontSize: 16)),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text('D',
                            style: greyTextStyle.copyWith(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(isAvailable: false, id: 'A1'),
                      SeatItem(isAvailable: false, id: 'B1'),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text('1',
                              style: greyTextStyle.copyWith(fontSize: 16)),
                        ),
                      ),
                      SeatItem(
                        id: 'C1',
                        isAvailable: false,
                      ),
                      SeatItem(id: 'D1'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A2'),
                      SeatItem(id: 'B2'),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text('2',
                              style: greyTextStyle.copyWith(fontSize: 16)),
                        ),
                      ),
                      SeatItem(id: 'C2'),
                      SeatItem(id: 'D2'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A3'),
                      SeatItem(id: 'B3'),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text('3',
                              style: greyTextStyle.copyWith(fontSize: 16)),
                        ),
                      ),
                      SeatItem(id: 'C3'),
                      SeatItem(id: 'D3'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A4'),
                      SeatItem(id: 'B4'),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text('3',
                              style: greyTextStyle.copyWith(fontSize: 16)),
                        ),
                      ),
                      SeatItem(id: 'C4'),
                      SeatItem(id: 'D4'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A5'),
                      SeatItem(
                        id: 'B5',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text('3',
                              style: greyTextStyle.copyWith(fontSize: 16)),
                        ),
                      ),
                      SeatItem(id: 'C5'),
                      SeatItem(id: "D5"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your seat ',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        state.join(', '),
                        
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total ',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        NumberFormat.currency(locale: 'id',symbol: 'IDR',decimalDigits: 0).format(state.length * destinations.price),
                        style: purpleTextStyle.copyWith(fontWeight: semiBold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget checkoutButton() {
      return CustomButton(
        title: 'Continue to checkout',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CheckoutPage()));
        },
        margin: EdgeInsets.only(top: 30, bottom: 46),
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [title(), seatStatus(), selectSeat(), checkoutButton()],
        ));
  }
}
