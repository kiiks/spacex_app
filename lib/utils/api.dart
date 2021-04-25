import 'package:dio/dio.dart';
import 'package:spaceX_app/Model/company_info.dart';
import 'package:spaceX_app/Model/landpad.dart';
import '../Model/launch.dart';

class ApiManager {
  var _baseURl = "https://api.spacexdata.com/v4";
  var dio = Dio();

  Future<List<Launch>> loadUpcomingLaunches() async {
    var json = await _getUpcomingLaunches();
    List<Launch> launchs = List();
    for (dynamic item in json) {
      launchs.add(Launch.fromJson(item));
    }
    return launchs;
  }

  Future<List<Launch>> loadPastLaunches() async {
    var json = await _getPastLaunches();
    List<Launch> launchs = List();
    for (dynamic item in json) {
      launchs.add(Launch.fromJson(item));
    }
    return launchs;
  }

  Future<Set<Landpad>> loadLandpads() async {
    var json = await _getLandpads();
    Set<Landpad> landpads = Set();
    for (dynamic item in json) {
      landpads.add(Landpad.fromJson(item));
    }
    return landpads;
  }

  Future<CompanyInfo> loadCompanyInfo() async {
    var json = await _getCompanyInfo();
    CompanyInfo info;
    info = CompanyInfo.fromJson(json);
    return info;
  }

  Future<dynamic> _getUpcomingLaunches() async {
    try {
      var response = await dio.get(_baseURl + "/launches/upcoming");
      return response.data;
    } catch (e) {
      print("Erreur: $e");
    }
  }

  Future<dynamic> _getPastLaunches() async {
    try {
      var response = await dio.get(_baseURl + "/launches/past");
      return response.data;
    } catch (e) {
      print("Erreur: $e");
    }
  }

  Future<dynamic> _getLandpads() async {
    try {
      var response = await dio.get(_baseURl + "/landpads");
      return response.data;
    } catch (e) {
      print("Erreur: $e");
    }
  }

  Future<dynamic> _getCompanyInfo() async {
    try {
      var response = await dio.get(_baseURl + "/company");
      return response.data;
    } catch (e) {
      print("Erreur: $e");
    }
  }
}
