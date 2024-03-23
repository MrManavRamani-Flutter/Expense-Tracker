import 'package:expense_tracker/views/screens/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/add_budget.dart';
import '../components/budget_history.dart';
import '../components/categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.put(HomePageController());

    List<Widget> pages = [
      const Categories(),
      const AddBudget(),
      const BudgetHistory(),
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.blueAccent.shade100,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PageView(
                  onPageChanged: (val) async {
                    await homePageController.changePage(val);
                  },
                  controller: homePageController.pageController,
                  children: pages,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(25),
                color: Colors.transparent,
                child: Obx(
                  () => BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    currentIndex: homePageController.currentPage.value,
                    onTap: (val) async {
                      await homePageController.changePage(val);
                    },
                    elevation: 0,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.pink,
                    useLegacyColorScheme: true,
                    enableFeedback: true,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.category),
                        label: 'Categories',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.monetization_on),
                        label: 'Add Budget',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.history),
                        label: 'History',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:expense_tracker/views/components/add_budget.dart';
// import 'package:expense_tracker/views/components/budget_history.dart';
// import 'package:expense_tracker/views/components/categories.dart';
// import 'package:expense_tracker/views/screens/controller/homepage_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     HomePageController homePageController = Get.put(HomePageController());
//
//     List<Widget> pages = [
//       const Categories(),
//       const AddBudget(),
//       const BudgetHistory(),
//     ];
//
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Colors.white,
//               Colors.blueAccent.shade200,
//             ],
//           ),
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               flex: 6,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: PageView(
//                   onPageChanged: (val) async {
//                     await homePageController.changePage(val);
//                   },
//                   controller: homePageController.pageController,
//                   children: pages,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Container(
//                   height: 80,
//                   margin: const EdgeInsets.all(25),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.black.withOpacity(0.75),
//                   ),
//                   child: Obx(
//                     () => BottomNavigationBar(
//                       currentIndex: homePageController.currentPage.value,
//                       onTap: (val) async {
//                         await homePageController.changePage(val);
//                       },
//                       elevation: 0,
//                       type: BottomNavigationBarType.shifting,
//                       selectedItemColor: Colors.white,
//                       unselectedItemColor: Colors.blue.shade200,
//                       items: const [
//                         BottomNavigationBarItem(
//                           icon: Icon(Icons.category),
//                           label: 'Add Category',
//                           backgroundColor: Colors.transparent,
//                         ),
//                         BottomNavigationBarItem(
//                           icon: Icon(Icons.monetization_on),
//                           label: 'Add Budget',
//                           backgroundColor: Colors.transparent,
//                         ),
//                         BottomNavigationBarItem(
//                           icon: Icon(Icons.history),
//                           label: 'Budget History',
//                           backgroundColor: Colors.transparent,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
