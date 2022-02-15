import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  final String id;
  final bool isAvailable;

  const SeatItem({Key? key, this.isAvailable = true, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);
    backgroundColor() {
      if (!isAvailable) {
        return KUnavailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return KAvailableColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return KUnavailableColor;
      } else {
        return kPrimaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'You',
            style: whiteTextStyle.copyWith(fontWeight: semiBold),
          ),
        );
      } else {
        SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if(isAvailable){
        context.read<SeatCubit>().selectSeat(id);

        }
      },
      child: Container(
        width: 48,
        height: 48,
        child: child(),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor(), width: 2),
            color: backgroundColor(),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
