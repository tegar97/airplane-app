import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/success_checkout_pages.dart';
import 'package:airplane/ui/widget/booking_details_item.dart';
import 'package:airplane/ui/widget/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:airplane/cubit/auth_cubit.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image_checkout.png'))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('CGK',
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold)),
                    Text('Tangerang',
                        style: greyTextStyle.copyWith(fontWeight: light)),
                  ],
                ),
                Column(
                  children: [
                    Text('TLC',
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold)),
                    Text('Ciliwung',
                        style: greyTextStyle.copyWith(fontWeight: light)),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget BookingDetails() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              NetworkImage(transaction.destination.imageUrl))),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(transaction.destination.name,
                          style: greyTextStyle.copyWith(fontWeight: light))
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
                    Text(transaction.destination.rating.toString(),
                        style: blackTextStyle.copyWith(fontWeight: medium))
                  ],
                ),
              ],
            ),

            // Note : Booking Text

            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Booking Details',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
            ),

            BookingDetailsItem(
              title: 'Traveler',
              valueText: transaction.amoutOfTraveler.toString(),
              valueColor: kBlackColor,
            ),
            BookingDetailsItem(
              title: 'Seat',
              valueText: transaction.selectedSeats,
              valueColor: kBlackColor,
            ),
            BookingDetailsItem(
              title: 'Insurance',
              valueText: transaction.insurance ? 'Yes' : 'No',
              valueColor: transaction.insurance ? kGreenColor : kRedColor,
            ),
            BookingDetailsItem(
              title: 'Refundable',
              valueText: transaction.refundable ? 'Yes' : 'No',
              valueColor: transaction.refundable ? kGreenColor : kRedColor,
            ),
            BookingDetailsItem(
              title: 'Vat',
              valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
              valueColor: kBlackColor,
            ),
            BookingDetailsItem(
              title: 'Price',
              valueText: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR', decimalDigits: 0)
                  .format(transaction.price),
              valueColor: kBlackColor,
            ),
            BookingDetailsItem(
              title: 'Grand Total',
              valueText: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR', decimalDigits: 0)
                  .format(transaction.grandTotal),
              valueColor: kPrimaryColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: kWhiteColor),
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/image_card.png'))),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icon_plane.png'))),
                                ),
                                Text(
                                  'Pay',
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 16, fontWeight: medium),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'IDR',
                                        decimalDigits: 0)
                                    .format(state.user.balance),
                                style: blackTextStyle.copyWith(
                                    fontSize: 18, fontWeight: medium),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Current Balance',
                                style:
                                    blackTextStyle.copyWith(fontWeight: light),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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

    Widget PayNowButton() {
      return CustomButton(
          title: 'Pay Now',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SuccessCheckoutPage()));
          },
          margin: EdgeInsets.only(top: 30));
    }

    Widget tacButton() {
      return Container(
          alignment: Alignment.center,
          child: Text('Terms and Conditions',
              style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                  decoration: TextDecoration.underline)),
          margin: EdgeInsets.only(top: 30, bottom: 30));
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          route(),
          BookingDetails(),
          paymentDetails(),
          PayNowButton(),
          tacButton()
        ],
      ),
    );
  }
}
