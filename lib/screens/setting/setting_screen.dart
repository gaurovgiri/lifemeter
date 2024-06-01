import 'package:flutter/material.dart';
import 'package:lifemeter/screens/setting/widgets/inputs.dart';
import 'package:lifemeter/screens/shared/widgets/header.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Header(),
            const Text(
              "Settings",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  decoration: TextDecoration.underline,
                  fontSize: 28,
                  fontWeight: FontWeight.w900),
            ),
            Inputs()
          ],
        ),
      ),
    );
  }
}
