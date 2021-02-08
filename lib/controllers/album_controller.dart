import 'dart:math';

import 'package:get/get.dart';
import 'package:upstreet_flutter_code_challenge/models/album.dart';
import 'package:upstreet_flutter_code_challenge/services/remote_service.dart';

class AlbumController extends GetxController {
  var isLoading = true.obs;
  var albumList = List<Album>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      print("IN CONTROLLER");
      isLoading(true);
      var products = await RemoteServices.fetchAlbumss();
      if (products != null) {
        albumList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void addItem(String url, String title) {
    int maxIndex = albumList.map<int>((e) => e.id).reduce(max);
    albumList.insert(
        0,
        Album(
            albumId: 1,
            thumbnailUrl: url,
            title: title,
            url: url,
            id: maxIndex + 1));
  }

  void editItem(Album album) {
    int index = albumList.indexWhere((element) => element.id == album.id);
    albumList[index] = album;
  }
}
