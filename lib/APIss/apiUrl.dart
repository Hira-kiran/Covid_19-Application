// ignore_for_file: prefer_interpolation_to_compose_strings, file_names
// app mai jitni b Api use krygy wo edr define krygy

class AppUrl {
  // this is url
  static const String baseUrl = "https://disease.sh/v3/covid-19/";

  // fetch world covid states
  static const String worldStatesApi = baseUrl + "all"; // end point of Api
  static const String countriesList = baseUrl + "countries"; //end point of Api
}
