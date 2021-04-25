import 'package:flutter/material.dart';
import 'package:spaceX_app/Model/company_info.dart';
import 'package:spaceX_app/utils/api.dart';
import 'package:spaceX_app/utils/locator.dart';

class AboutView extends StatefulWidget {
  AboutView({Key key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  CompanyInfo info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About SpaceX")),
      body: FutureBuilder(
        future: locator<ApiManager>().loadCompanyInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            info = snapshot.data;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.grey[200],
                            shadows: [
                              kElevationToShadow.entries
                                  .elementAt(5)
                                  .value
                                  .first
                            ]),
                        child: Center(
                          child: Column(
                            children: [
                              Text(info.name,
                                  style: TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Founded in " +
                                      info.founded.toString() +
                                      " by " +
                                      info.founder,
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(info.summary),
                    ),
                    Text(
                      "Some statistics",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" - SpaceX created " +
                          info.vehicles.toString() +
                          " different vehicules."),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" - SpaceX have " +
                          info.employees.toString() +
                          " employees."),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(" - SpaceX operates on " +
                          info.launchSites.toString() +
                          " launch sites (See the Map)!"),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
