import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upstreet_flutter_code_challenge/controllers/album_controller.dart';
import 'package:upstreet_flutter_code_challenge/routes/app_routes_constant.dart';
import 'package:upstreet_flutter_code_challenge/screens/album_tile.dart';
import 'package:upstreet_flutter_code_challenge/utility/app_colors.dart';

// TODO:
// 1. Create a list view to display the album data from the fetching function in `api.dart`
// 2. The item of the list should contain the album's thumbnail and title

class AlbumList extends StatelessWidget {
  final AlbumController albumController = Get.put(AlbumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album List'),
      ),
      backgroundColor: colorBackground,
      body: Obx(() {
        if (albumController.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return ListView.builder(
            itemCount: albumController.productList.length,
            itemBuilder: (context, index) {
              return AlbumTile(albumController.productList[index]);
            },
          );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(routeNewAlbum);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
