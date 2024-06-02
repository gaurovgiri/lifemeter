import 'package:flutter/material.dart';
import 'package:lifemeter/providers/lifemeterprovider.dart';
import 'package:provider/provider.dart';

class RemainingDays extends StatelessWidget {
  const RemainingDays({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LifeMeterProvider>(
      builder: (context, value, child) {
        return Column(
          children: [
            const Text(
              "Remaining Days",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    // Stroke text
                    Text(
                      '${value.remainingDays}',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.black,
                      ),
                    ),
                    // Fill text
                    Text(
                      '${value.remainingDays}',
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    // Stroke text
                    Text(
                      ' / ${value.totalDays}',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.black,
                      ),
                    ),
                    // Fill text
                    Text(
                      ' / ${value.totalDays}',
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
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
