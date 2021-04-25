import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Shared {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/favorites.json');
  }

  Future<File> writeFavorites(List<Map<String, dynamic>> favorites) async {
    final file = await _localFile;

    return file.writeAsString(jsonEncode(favorites));
  }

  Future<List<Map<String, dynamic>>> readFavorites() async {
    try {
      final file = await _localFile;

      var contents = await file.readAsString();

      List<Map<String, dynamic>> maps = List();
      dynamic data = jsonDecode(contents);
      for (dynamic item in data) {
        var newMap = fromFavoritesJson(item);
        maps.add(newMap);
      }

      return maps;
    } catch (e) {
      return List();
    }
  }

  Map<String, dynamic> fromFavoritesJson(dynamic json) {
    Map<String, dynamic> map = {"id": json["id"], "favorite": json["favorite"]};
    return map;
  }
}
