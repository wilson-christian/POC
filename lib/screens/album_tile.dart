import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upstreet_flutter_code_challenge/models/album.dart';
import 'package:upstreet_flutter_code_challenge/routes/app_routes_constant.dart';

class AlbumTile extends StatelessWidget {
  final Album album;
  const AlbumTile(this.album);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () => Get.toNamed(routeDetailAlbum, arguments: album),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(album.thumbnailUrl),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Text(
                album.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
