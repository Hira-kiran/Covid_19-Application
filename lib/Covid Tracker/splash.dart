import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import '../Covid Tracker/world_states.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// thickerProvider help to build animations
class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
// now build animation controller
  late final AnimationController controller = AnimationController(
      duration: const Duration(
          seconds: 3), // kitny duration k leye animation ko run hona h
      vsync: this)
    ..repeat();
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WordStates())));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "images/bgimage.jpeg",
              ),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: AnimatedBuilder(
                animation: controller,
                child: Center(
                    child: Container(
                        height: 370.h,
                        width: 3700.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40)),
                        child: const Image(
                            image: AssetImage("images/virus.png")))),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: controller.value * 2.0 * math.pi,
                    child: child,
                  );
                }),
          ),
          Center(
              child: Text(
            "   Covid - 19\nTracker App",
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ))
        ],
      ),
    ));
  }
}
