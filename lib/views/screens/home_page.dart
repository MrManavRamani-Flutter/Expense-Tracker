import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/views/screens/add_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [];
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Your Balance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '\$1,500.00',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() =>
                    AddTransactionScreen()); // Navigate to add transaction screen using Get
              },
              child: const Text('Add Transaction'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return ListTile(
                    title: Text(transaction.title),
                    subtitle:
                        Text('\$${transaction.amount.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Remove transaction
                        transactions.removeAt(index);
                        Get.snackbar(
                          'Success',
                          'Transaction removed',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
    //   Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Expense Tracker'),
    //     actions: [
    //       IconButton(
    //         icon: const Icon(Icons.settings),
    //         onPressed: () {
    //           // Navigate to settings screen
    //         },
    //       ),
    //     ],
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //         const SizedBox(height: 20),
    //         const Text(
    //           'Your Balance',
    //           style: TextStyle(
    //             fontSize: 18,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         const SizedBox(height: 10),
    //         const Text(
    //           '\$1,500.00',
    //           style: TextStyle(
    //             fontSize: 36,
    //             fontWeight: FontWeight.bold,
    //             color: Colors.blue,
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         ElevatedButton(
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (context) => const AddTransactionScreen()),
    //             );
    //           },
    //           child: const Text('Add Transaction'),
    //         ),
    //         const SizedBox(height: 20),
    //         Expanded(
    //           child: ListView.builder(
    //             itemCount: 10, // Replace with actual data
    //             itemBuilder: (context, index) {
    //               return ListTile(
    //                 title: Text('Transaction Item ${index + 1}'),
    //                 subtitle: const Text('\$100.00'),
    //                 trailing: IconButton(
    //                   icon: const Icon(Icons.delete),
    //                   onPressed: () {
    //                     // Delete transaction
    //                   },
    //                 ),
    //               );
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
