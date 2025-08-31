import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/view/screen/edit_profile_screen.dart';
import 'package:examapp/view/screen/home_screen.dart';
import 'package:examapp/view/screen/result_screen.dart';
import 'package:flutter/material.dart';

class HomeInitialScreen extends StatefulWidget {
  const HomeInitialScreen({super.key});

  @override
  State<HomeInitialScreen> createState() => _HomeInitialScreenState();
}

class _HomeInitialScreenState extends State<HomeInitialScreen> {
  final List<Widget> _screens = [HomeScreen(), ResultScreen(),EditProfileScreen()];

  int _currentInex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentInex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentInex = index;
          });
        },
        currentIndex: _currentInex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context)!.explore,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: AppLocalizations.of(context)!.result,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
