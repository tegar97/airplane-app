import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  CollectionReference _transactionRefrence =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionRefrence.add({
        'destination': transaction.destination.toJson(),
        'amountOfTraveler': transaction.amoutOfTraveler,
        'selectedSeats': transaction.selectedSeats,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal
      });
    } catch (e) {
      throw e;
    }
  }

  
}
