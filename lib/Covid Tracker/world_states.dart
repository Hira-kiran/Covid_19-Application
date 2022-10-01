import 'package:covid_tracker/APIss/statesServises.dart';
import 'package:covid_tracker/Covid%20Tracker/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import '../Modelss/worldstateModel.dart';
import 'countryList.dart';

class WordStates extends StatefulWidget {
  const WordStates({super.key});

  @override
  State<WordStates> createState() => _WordStatesState();
}

class _WordStatesState extends State<WordStates> with TickerProviderStateMixin {
  // now build animation controller
  late final AnimationController controller = AnimationController(
      duration: const Duration(
          seconds: 3), // kitny duration k leye animation ko run hona h
      vsync: this)
    ..repeat();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  final colorList = <Color>[
    Colors.green,
    Colors.blue,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              FutureBuilder(
                  future: statesServices.fatchworldstateRecord(),
                  builder:
                      (context, AsyncSnapshot<WoldStateApiModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 270),
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            size: 50.0,
                            controller: controller,
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                              "Total":
                                  double.parse(snapshot.data!.cases.toString()),
                              "Recovered": double.parse(
                                  snapshot.data!.recovered.toString()),
                              "Death": double.parse(
                                  snapshot.data!.deaths.toString()),
                            },

                            // for show data in %
                            chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true),
                            animationDuration:
                                const Duration(milliseconds: 1200),
                            chartType: ChartType.ring,
                            colorList: colorList,
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.2,
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 12, right: 12),
                            child: Card(
                                child: Column(
                              children: [
                                ConponentworldState(
                                  title: "Total Cases:",
                                  value: snapshot.data!.cases.toString(),
                                ),
                                ConponentworldState(
                                  title: "Deaths:",
                                  value: snapshot.data!.deaths.toString(),
                                ),
                                ConponentworldState(
                                  title: "Recoverd:",
                                  value: snapshot.data!.recovered.toString(),
                                ),
                                ConponentworldState(
                                  title: "Active:",
                                  value: snapshot.data!.active.toString(),
                                ),
                                ConponentworldState(
                                  title: "Critical:",
                                  value: snapshot.data!.critical.toString(),
                                ),
                                ConponentworldState(
                                  title: "Today Deaths:",
                                  value: snapshot.data!.todayDeaths.toString(),
                                ),
                                ConponentworldState(
                                  title: "Today Recovered:",
                                  value:
                                      snapshot.data!.todayRecovered.toString(),
                                ),
                              ],
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CountriesListScreen()));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  height: 55.h,
                                  width: 360.w,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(
                                    "Track Countries",
                                    style: TextStyle(fontSize: 18.sp),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      ],
    ));
  }
}
