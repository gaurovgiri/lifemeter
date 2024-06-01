import 'package:flutter/material.dart';
import 'package:lifemeter/screens/setting/setting_screen.dart';
import 'package:lifemeter/screens/shared/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Header(),
            Positioned(
                right: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.05,
                child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingScreen()),
                    );
                  },
                ))
          ])
        ],
      ),
    );
  }
}
