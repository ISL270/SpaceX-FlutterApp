import '../../Presentation_layer/past_launches_screen.dart';
import 'package:flutter/material.dart';

import 'next_launch_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _screensList = [];
  int? selectedPage = 0;

  @override
  void initState() {
    _screensList.add(const NextLaunch());
    _screensList.add(const PastLaunches());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff585858),
      body: IndexedStack(
        index: selectedPage,
        children: _screensList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.airplanemode_active_outlined), label: "Next"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: "Past"),
        ],
        currentIndex: selectedPage!,
        onTap: (index) => setState(() {
          selectedPage = index;
        }),
        backgroundColor: const Color(0xff4d4d4d),
      ),
    );
  }
}
