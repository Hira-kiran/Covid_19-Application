// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../APIss/statesServises.dart';
import 'details_screen.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  hintText: "Search with country name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green))),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: statesServices.fatchworldCountryRecord(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade500,
                            highlightColor: Colors.grey.shade500,
                            child: Column(children: [
                              ListTile(
                                title: Container(
                                  height: 10.h,
                                  width: 90.w,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 10.h,
                                  width: 90.w,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: 50.h,
                                  width: 50.w,
                                  color: Colors.white,
                                ),
                              )
                            ]),
                          );
                        });
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String countryName = snapshot.data![index]["country"];
                          if (searchController.text.isEmpty) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                              name: snapshot.data![index]
                                                  ["country"],
                                              image: snapshot.data![index]
                                                  ["countryInfo"]["flag"],
                                              active: snapshot.data![index]
                                                  ["active"],
                                              test: snapshot.data![index]
                                                  ["tests"],
                                              totalRecovered: snapshot
                                                  .data![index]["recovered"],
                                              totalCases: snapshot.data![index]
                                                  ["cases"],
                                              totalDeath: snapshot.data![index]
                                                  ["deaths"],
                                              critical: snapshot.data![index]
                                                  ["critical"],
                                            )));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]["country"]),
                                subtitle: Text(
                                    snapshot.data![index]["cases"].toString()),
                                leading: Image(
                                    height: 50.h,
                                    width: 50.w,
                                    image: NetworkImage(snapshot.data![index]
                                        ["countryInfo"]["flag"])),
                              ),
                            );
                          } else if (countryName
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                              name: snapshot.data![index]
                                                  ["country"],
                                              image: snapshot.data![index]
                                                  ["countryInfo"]["flag"],
                                              active: snapshot.data![index]
                                                  ["active"],
                                              test: snapshot.data![index]
                                                  ["tests"],
                                              totalRecovered: snapshot
                                                  .data![index]["recovered"],
                                              totalCases: snapshot.data![index]
                                                  ["cases"],
                                              totalDeath: snapshot.data![index]
                                                  ["deaths"],
                                              critical: snapshot.data![index]
                                                  ["critical"],
                                            )));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]["country"]),
                                subtitle: Text(
                                    snapshot.data![index]["cases"].toString()),
                                leading: Image(
                                    height: 50.h,
                                    width: 50.w,
                                    image: NetworkImage(snapshot.data![index]
                                        ["countryInfo"]["flag"])),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
