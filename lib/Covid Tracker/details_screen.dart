// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components.dart';

class DetailsScreen extends StatelessWidget {
  String image;
  String name;

  // ignore: prefer_typing_uninitialized_variables
  var totalCases, totalDeath, active, critical, totalRecovered, test;
  DetailsScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.totalCases,
      required this.active,
      required this.critical,
      required this.test,
      required this.totalRecovered,
      required this.totalDeath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(name)),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 50, left: 10, right: 10, bottom: 20),
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: ConponentworldState(
                                  title: "Cases:",
                                  value: totalCases.toString()),
                            ),
                            ConponentworldState(
                                title: "Active:", value: active.toString()),
                            ConponentworldState(
                                title: "Critical:", value: critical.toString()),
                            ConponentworldState(
                                title: "Recovered:",
                                value: totalRecovered.toString()),
                            ConponentworldState(
                                title: "Deaths:", value: totalDeath.toString()),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage: NetworkImage(image),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
