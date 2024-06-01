import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Stack(
        children: [
          Positioned(
            top: -MediaQuery.of(context).size.height * 0.25,
            left: -MediaQuery.of(context).size.width * 0.2,
            right: -MediaQuery.of(context).size.width * 0.2,
            child: Container(
              width: MediaQuery.of(context).size.width * 2,
              height: MediaQuery.of(context).size.height * 0.45,
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
                Stack(
                  children: [
                    // Black stroke
                    Text(
                      'LifeMeter',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Fredoka',
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.black,
                      ),
                    ),
                    // White fill
                    const Text(
                      'LifeMeter',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Fredoka',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1 + 0.1 * _animation.value,
                      child: child,
                    );
                  },
                  child: Image.asset("assets/images/logo.png"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
