import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/features/home/presentation/screens/home_screen.dart';
import 'package:exam_feed/features/profile/presentation/screens/user_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  List<Widget> pages = const [
    HomeScreen(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primary,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Image.asset('assets/images/home.png')
                : Image.asset('assets/images/home_filled.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? Image.asset('assets/images/messages_filled.png')
                  : Image.asset('assets/images/messages.png'),
              label: 'messages'),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Image.asset('assets/images/chart_filled.png')
                : Image.asset('assets/images/chart.png'),
            label: 'chart',
          ),
          BottomNavigationBarItem(
              icon: _currentIndex == 3
                  ? Image.asset('assets/images/discover_filled.png')
                  : Image.asset('assets/images/discover.png'),
              label: 'discover'),
          BottomNavigationBarItem(
              icon: _currentIndex == 4
                  ? Image.asset('assets/images/profile_circle_filled.png')
                  : Image.asset('assets/images/profile_circle.png'),
              label: 'profile'),
        ],
      ),
      body: pages[_currentIndex],
    );
  }
}
