import 'package:flutter/material.dart';
import 'package:spaceX_app/Model/launch.dart';
import 'package:spaceX_app/utils/api.dart';
import 'package:spaceX_app/utils/locator.dart';

class History extends StatefulWidget {
  History({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Launch> launches = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Launches History"),
      ),
      body: FutureBuilder(
          future: locator<ApiManager>().loadPastLaunches(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              launches = snapshot.data;
              return ListView.builder(
                itemCount: launches.length,
                itemBuilder: (context, index) {
                  final item = launches[index];

                  return InkWell(
                      child: Row(
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            item.links.patch.small ??
                                launches[0].links.patch.small,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name ?? "No details",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(item.dateUtc.toString() ??
                                "Surprise for launch !")
                          ],
                        ),
                      )
                    ],
                  ));
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
