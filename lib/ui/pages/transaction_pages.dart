import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPages extends StatefulWidget {
  const TransactionPages({Key? key}) : super(key: key);

  @override
  State<TransactionPages> createState() => _TransactionPagesState();
}

class _TransactionPagesState extends State<TransactionPages> {
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        print(state);
        if (state is TransactionLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TransactionSuccess) {
          if (state.transactions.length == 0) {
            return Center(child: Text('Kamu belum memiliki transaksi'));
          } else {
            return ListView.builder(
                itemCount: state.transactions.length,
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin
                ),
                itemBuilder: (context, index) {
                  return TransactionCard(state.transactions[index]);
                });
          }
        }
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Text('Hahaha'),
        );
      },
    );
  }
}
