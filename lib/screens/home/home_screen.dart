import 'package:flutter/material.dart';
import 'package:lifemeter/screens/home/widgets/life_progress.dart';
import 'package:lifemeter/screens/home/widgets/remaining_days.dart';
import 'package:lifemeter/screens/home/widgets/remaining_time.dart';
import 'package:lifemeter/screens/home/widgets/setting_button.dart';

import 'package:lifemeter/screens/shared/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Stack(children: [Header(), SettingButton()]),
          RemainingDays(),
          SizedBox(height: 10),
          LifeProgress(),
          SizedBox(height: 10),
          RemainingTime()
        ],
      ),
    );
  }
}
