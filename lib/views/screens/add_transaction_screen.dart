import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransactionScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                final amount = double.tryParse(amountController.text) ?? 0.0;
                final transaction = Transaction(
                    title: title,
                    amount: amount,
                    isExpense:
                        true); // You can adjust isExpense based on user input
                Get.back(
                    result:
                        transaction); // Pass the transaction back to the previous screen
              },
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
