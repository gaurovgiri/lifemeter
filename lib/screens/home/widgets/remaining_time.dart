import 'package:flutter/material.dart';
import 'package:lifemeter/providers/lifemeterprovider.dart';
import 'package:provider/provider.dart';

class RemainingTime extends StatelessWidget {
  const RemainingTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LifeMeterProvider>(
      builder: (context, value, child) {
        return Column(
          children: [
            const Text(
              "Remaining Time",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.24,
              ),
              child: Column(
                children: [
                  _buildTimeText(value.hours, 'hours'),
                  const SizedBox(height: 10),
                  _buildTimeText(value.minutes, 'min'),
                  const SizedBox(height: 10),
                  _buildTimeText(value.seconds, 'sec'),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  Widget _buildTimeText(int value, String unit) {
    return Row(
      children: [
        Stack(
          children: [
            // Stroke text
            Text(
              '$value',
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
              '$value',
              style: const TextStyle(
                fontFamily: "Montserrat",
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Stack(
          children: [
            // Stroke text
            Text(
              unit,
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
              unit,
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
    );
  }
}
