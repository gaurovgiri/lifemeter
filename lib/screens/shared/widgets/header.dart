import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Stack(
        children: [
          Positioned(
            top: -MediaQuery.of(context).size.height * 0.2,
            left: -MediaQuery.of(context).size.width * 0.2,
            right: -MediaQuery.of(context).size.width * 0.2,
            child: Container(
              width: MediaQuery.of(context).size.width * 2,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const ShapeDecoration(
                color: Color(0xFF2DB073),
                shape: OvalBorder(),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'LifeMeter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Fredoka',
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        // Bottom-left
                        offset: Offset(-1, -1),
                        color: Colors.black,
                        blurRadius: 0,
                      ),
                      Shadow(
                        // Bottom-right
                        offset: Offset(1, -1),
                        color: Colors.black,
                        blurRadius: 0,
                      ),
                      Shadow(
                        // Top-right
                        offset: Offset(1, 1),
                        color: Colors.black,
                        blurRadius: 0,
                      ),
                      Shadow(
                        // Top-left
                        offset: Offset(-1, 1),
                        color: Colors.black,
                        blurRadius: 0,
                      ),
                    ],
                  ),
                ),
                Image.asset("assets/images/logo.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
