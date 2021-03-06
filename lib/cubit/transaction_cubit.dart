import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTranscation(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transaction);
      emit(TransactionSuccess(const []));
      ;
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void fetchTransactions() async {
    try {
      emit(TransactionLoading());
      print('tess');
      List<TransactionModel> transactions =
          await TransactionService().fetchTransaction();

      print(transactions);

      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
