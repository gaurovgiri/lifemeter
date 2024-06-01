import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifemeter/providers/lifemeterprovider.dart';
import 'package:lifemeter/screens/home/home_screen.dart';
import 'package:lifemeter/screens/setting/setting_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LifeMeterProvider(),
      child: const LifeMeter(),
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class LifeMeter extends StatelessWidget {
  const LifeMeter({super.key});

  @override
  Widget build(BuildContext context) {
    final alreadySet = Provider.of<LifeMeterProvider>(context).alreadySet;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: alreadySet ? const HomeScreen() : const SettingScreen(),
    );
  }
}
