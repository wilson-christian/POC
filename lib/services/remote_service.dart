import 'package:http/http.dart' as http;
import 'package:upstreet_flutter_code_challenge/models/album.dart';
import 'package:upstreet_flutter_code_challenge/services/api.dart';


class RemoteServices {
  static var client = http.Client();

  static Future<List<Album>> fetchAlbumss() async {
    var response = await client.get(
        API_ALBUMS_PHOTOS);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return albumFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}