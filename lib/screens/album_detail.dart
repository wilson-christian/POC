import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upstreet_flutter_code_challenge/models/album.dart';
import 'package:upstreet_flutter_code_challenge/routes/app_routes_constant.dart';
import 'package:upstreet_flutter_code_challenge/utility/app_colors.dart';

class DetailAlbum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Album album = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Id : ${album.id}"),
      ),
      backgroundColor: colorBackground,
      body: bodyOfPage(album),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(routeNewAlbum, arguments: album);
        },
        child: Icon(Icons.edit),
      ),
    );
  }

  Card bodyOfPage(Album album) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(album.thumbnailUrl),
            ),
            SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  album.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
