import 'package:get/get.dart';
import 'package:upstreet_flutter_code_challenge/routes/app_routes_constant.dart';
import 'package:upstreet_flutter_code_challenge/screens/album_detail.dart';
import 'package:upstreet_flutter_code_challenge/screens/album_list.dart';
import 'package:upstreet_flutter_code_challenge/screens/album_add_edit.dart';

class AppRouter {
  static final route = [
    GetPage(
      name: routeHome,
      page: () => AlbumList(),
    ),
    GetPage(
      name: routeNewAlbum,
      page: () => AddEditAlbum(),
    ),
    GetPage(
      name: routeDetailAlbum,
      page: () => DetailAlbum(),
    ),
  ];
}
