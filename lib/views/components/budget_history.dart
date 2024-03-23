import 'dart:typed_data';

import 'package:expense_tracker/views/screens/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BudgetHistory extends StatelessWidget {
  const BudgetHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          "Budget History",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<HomePageController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: homePageController.fetchedBudget.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> budget =
                  homePageController.fetchedBudget[index];
              Uint8List image = homePageController
                  .budgetImage("${budget['category']}") as Uint8List;

              return GestureDetector(
                onLongPress: () {
                  Get.defaultDialog(
                    contentPadding: const EdgeInsets.all(25),
                    title: "Delete",
                    content: const Text(
                      "Are you sure to want to delete a Budget?",
                    ),
                    confirm: ElevatedButton(
                      onPressed: () {
                        homePageController
                            .deleteBudget(budget['budgetId'])
                            .then((value) {
                          Get.back();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade400),
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    cancel: OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.green.shade800),
                      ),
                    ),
                  );
                },
                onTap: () {
                  homePageController.bottomSheetForUpdate(budget, context);
                },
                child: Card(
                  elevation: 2,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: MemoryImage(image),
                    ),
                    title: Text(
                      "${budget['category']}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          "Note: ${budget['note']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Date: ${budget['date']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Time: ${budget['time']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Payment Method: ${budget['method']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Payment Type: ${budget['type']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    trailing: Text(
                      "${budget['amount']} Rs",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: (budget['type'] == 'Expense')
                            ? Colors.red
                            : Colors.green.shade800,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// import 'dart:typed_data';
//
// import 'package:expense_tracker/views/screens/controller/homepage_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:get/get.dart';
//
// class BudgetHistory extends StatelessWidget {
//   const BudgetHistory({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     HomePageController homePageController = Get.put(HomePageController());
//
//     return CustomScrollView(
//       slivers: [
//         const SliverAppBar(
//           title: Text("Budget History",
//               style: TextStyle(fontWeight: FontWeight.bold)),
//           backgroundColor: Colors.transparent,
//         ),
//         GetBuilder<HomePageController>(builder: (controller) {
//           return SliverList(
//             delegate: SliverChildListDelegate(
//               homePageController.fetchedBudget.map(
//                 (e) {
//                   Uint8List image = homePageController
//                       .budgetImage("${e['category']}") as Uint8List;
//                   return Slidable(
//                     closeOnScroll: true,
//                     endActionPane: ActionPane(
//                       motion: const DrawerMotion(),
//                       children: [
//                         SlidableAction(
//                           borderRadius: const BorderRadius.horizontal(
//                             left: Radius.circular(25),
//                           ),
//                           onPressed: (ctx) {
//                             Get.defaultDialog(
//                               contentPadding: const EdgeInsets.all(25),
//                               title: "Delete",
//                               content: const Text(
//                                 "Are you sure to want to delete a Budget?",
//                               ),
//                               confirm: ElevatedButton(
//                                 onPressed: () {
//                                   homePageController
//                                       .deleteBudget(e['budgetId'])
//                                       .then((value) {
//                                     Get.back();
//                                   });
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.red.shade400),
//                                 child: const Text(
//                                   "Delete",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                               cancel: OutlinedButton(
//                                 onPressed: () {
//                                   Get.back();
//                                 },
//                                 child: Text(
//                                   "Cancel",
//                                   style:
//                                       TextStyle(color: Colors.green.shade800),
//                                 ),
//                               ),
//                             );
//                           },
//                           backgroundColor: Colors.red.shade400,
//                           foregroundColor: Colors.white,
//                           icon: Icons.delete,
//                           label: 'Delete',
//                         ),
//                         SlidableAction(
//                           borderRadius: const BorderRadius.horizontal(
//                             right: Radius.circular(25),
//                           ),
//                           onPressed: (ctx) {
//                             homePageController.bottomSheetForUpdate(e, context);
//                           },
//                           backgroundColor: Colors.lightBlueAccent.shade200,
//                           foregroundColor: Colors.white,
//                           icon: Icons.edit,
//                           label: 'Edit',
//                         ),
//                       ],
//                     ),
//                     child: Container(
//                       margin: const EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                         color: (e['type'] == 'Expense')
//                             ? Colors.red.withOpacity(0.2)
//                             : Colors.blueGrey.shade800.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(25),
//                         border: Border.all(
//                           color: (e['type'] == 'Expense')
//                               ? Colors.red
//                               : Colors.blueGrey.shade800,
//                           width: 2,
//                         ),
//                       ),
//                       child: ListTile(
//                         title: Text(
//                           "${e['category']}",
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         leading: Image.memory(image),
//                         isThreeLine: true,
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Note: ${e['note']}",
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               "Date: ${e['date']}",
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               "Time: ${e['time']}",
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               "Payment Method: ${e['method']}",
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               "Payment Type: ${e['type']}",
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                         trailing: Padding(
//                           padding: const EdgeInsets.only(top: 15),
//                           child: Text(
//                             "${e['amount']} Rs",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: (e['type'] == 'Expense')
//                                     ? Colors.red
//                                     : Colors.green.shade800),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ).toList(),
//             ),
//           );
//         })
//       ],
//     );
//   }
// }
