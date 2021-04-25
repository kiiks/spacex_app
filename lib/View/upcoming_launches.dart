import 'package:flutter/material.dart';
import 'package:spaceX_app/Model/launch.dart';
import 'package:spaceX_app/View/launch_detail.dart';
import 'package:spaceX_app/utils/api.dart';
import 'package:spaceX_app/utils/locator.dart';
import 'package:spaceX_app/utils/shared.dart';
import 'package:spaceX_app/widgets/countdown.dart';

class UpcomingLaunches extends StatefulWidget {
  UpcomingLaunches({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UpcomingLaunchesState createState() => _UpcomingLaunchesState();
}

class _UpcomingLaunchesState extends State<UpcomingLaunches> {
  List<Launch> launches = List();
  List<Map<String, dynamic>> favorites;

  @override
  void initState() {
    locator<Shared>().readFavorites().then((data) => {
          setState(() {
            favorites = data;
          })
        });

    super.initState();
  }

  @override
  void dispose() async {
    await locator<Shared>().writeFavorites(favorites);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Launches"),
      ),
      body: FutureBuilder(
          future: locator<ApiManager>().loadUpcomingLaunches(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              launches = snapshot.data;
              return ListView.separated(
                separatorBuilder: (context, value) => Padding(
                  child: null,
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                ),
                itemCount: launches.length,
                itemBuilder: (context, index) {
                  final item = launches[index];
                  final launchDate = DateTime.parse(item.dateUtc);

                  if (index == 0) {
                    // Si c'est le prochain lancement
                    return InkWell(
                        onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LaunchDetail(
                                        launch: item,
                                      )))
                            },
                        onLongPress: () => {
                              setState(() {
                                if (isFavorites(item.id)) {
                                  removeFavorite(item.id);
                                } else {
                                  addFavorite(item.id);
                                }
                              })
                            },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blueGrey[100],
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 1.5,
                                      spreadRadius: 0.5)
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        width: 100,
                                        height: 100,
                                        child: Image.network(
                                          item.links.patch.small ??
                                              "https://github.com/kiiks/personal_data-base/raw/main/images/image_placeholder.png",
                                          fit: BoxFit.contain,
                                        )),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name ?? "No details",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(item.dateUtc.toString() ??
                                              "Surprise for launch !")
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: isFavorites(item.id)
                                            ? Icon(Icons.favorite,
                                                color: Colors.red)
                                            : Icon(Icons.favorite_border,
                                                color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Center(
                                      child: Countdown(
                                        launchDate:
                                            DateTime.parse(item.dateUtc),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ));
                  } else {
                    // Sinon
                    return InkWell(
                        onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LaunchDetail(
                                        launch: item,
                                      )))
                            },
                        onLongPress: () => {
                              setState(() {
                                if (isFavorites(item.id)) {
                                  removeFavorite(item.id);
                                } else {
                                  addFavorite(item.id);
                                }
                              })
                            },
                        child: Row(
                          children: [
                            Container(
                                width: 100,
                                height: 100,
                                child: Image.network(
                                  item.links.patch.small ??
                                      "https://github.com/kiiks/personal_data-base/raw/main/images/image_placeholder.png",
                                  fit: BoxFit.contain,
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
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(launchDate.toLocal().toString() ??
                                      "Surprise for launch !")
                                ],
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: isFavorites(item.id)
                                    ? Icon(Icons.favorite, color: Colors.red)
                                    : Icon(Icons.favorite_border,
                                        color: Colors.black),
                              ),
                            )
                          ],
                        ));
                  }
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

  void addFavorite(String id) {
    favorites.add({"id": id, "favorite": true});
  }

  void removeFavorite(String id) {
    favorites.removeWhere((item) => item.containsValue(id));
  }

  bool isFavorites(String id) {
    for (int i = 0; i < favorites.length; i++) {
      if (favorites[i].containsValue(id)) {
        return true;
      }
    }
    return false;
  }
}
