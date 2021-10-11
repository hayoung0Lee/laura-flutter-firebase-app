import 'package:app/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../components/gallery_item.dart';
import "../components/custom_app_bar.dart";

class Gallery extends StatelessWidget {
  Gallery({Key? key}) : super(key: key);

  final List<Transaction> transactions = List<Transaction>.generate(
    100,
    (index) => Transaction(
      id: index,
      customerId: index + 1,
      amount: 1000,
      date: DateTime.now(),
      imgUrl: 'https://picsum.photos/400',
    ),
  );

  String formatDate(DateTime tx) {
    return "${tx.year.toString()}년 ${tx.month.toString()}월 ${tx.day.toString()}일";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Gallery"),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          return GalleryItem(
            title: formatDate(transactions[index].date),
            imgUrl: transactions[index].imgUrl,
          );
        },
      ),
    );
  }
}
