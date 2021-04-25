import 'package:flutter/material.dart';
import 'package:spaceX_app/Model/launch.dart';

class LaunchDetail extends StatefulWidget {
  LaunchDetail({Key key, this.launch}) : super(key: key);

  final Launch launch;

  @override
  _LaunchDetailState createState() => _LaunchDetailState();
}

class _LaunchDetailState extends State<LaunchDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Launch Detail"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Image.network(
                  widget.launch.links.patch.small ??
                      "https://github.com/kiiks/personal_data-base/raw/main/images/image_placeholder.png",
                  fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 5),
                child: Text((widget.launch.name ?? "No title"),
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Text(
                  "Launch date : " +
                      toDateString(DateTime.parse(widget.launch.dateUtc)),
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 8),
                child: Text(widget.launch.details ?? "No details"),
              )
            ],
          ),
        ),
      ),
    );
  }

  String toDateString(DateTime date) {
    return (date.day < 10 ? "0" + date.day.toString() : date.day.toString()) +
        "/" +
        (date.month < 10
            ? "0" + date.month.toString()
            : date.month.toString()) +
        "/" +
        date.year.toString() +
        " à " +
        (date.hour < 10 ? "0" + date.hour.toString() : date.hour.toString()) +
        ":" +
        (date.minute < 10
            ? "0" + date.minute.toString()
            : date.minute.toString()) +
        " UTC";
  }
}
