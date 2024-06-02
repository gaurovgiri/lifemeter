import 'package:flutter/material.dart';
import 'package:lifemeter/providers/lifemeterprovider.dart';
import 'package:provider/provider.dart';

class LifeProgress extends StatelessWidget {
  const LifeProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LifeMeterProvider>(
      builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Life Progress",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: value.percentage *
                        MediaQuery.of(context).size.width *
                        0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                  ),
                  Center(
                    child: Text(
                      "${(value.percentage * 100).toStringAsFixed(2)}%",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ],
        );
      },
    );
  }
}
