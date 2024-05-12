import 'package:flutter/material.dart';
import 'package:workshop_o1/screen/dashboard.dart';

class BottomItemNavScreen extends StatefulWidget {
  const BottomItemNavScreen({super.key});

  @override
  State<BottomItemNavScreen> createState() => _BottomItemNavScreenState();
}

class _BottomItemNavScreenState extends State<BottomItemNavScreen> {
  List children = [
    Container(
      height: 200,
      decoration: const BoxDecoration(color: Colors.green),
    ),
    const DashBoardScreen(),
    Container(
      height: 200,
      decoration: const BoxDecoration(color: Colors.blueGrey),
    ),
    Container(
      height: 200,
      decoration: const BoxDecoration(color: Colors.blue),
    )
  ];
  int curRentState = 1;
  ontap(index) {
    setState(() {
      curRentState = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 50.0,
        width: 50.0,
        child: FittedBox(
          child: FloatingActionButton(backgroundColor: Colors.blue,
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            // elevation: 5.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: children[curRentState],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: curRentState,
          type: BottomNavigationBarType.fixed,
          onTap: ontap,
          items: const [
            BottomNavigationBarItem(
              label: "profile",
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_phone_sharp), label: "contact"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add), label: "notification")
          ]),
    );
  }
}
