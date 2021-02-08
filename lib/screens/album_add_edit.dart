import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:upstreet_flutter_code_challenge/controllers/album_controller.dart';
import 'package:upstreet_flutter_code_challenge/models/album.dart';
import 'package:upstreet_flutter_code_challenge/routes/app_routes_constant.dart';
import 'package:upstreet_flutter_code_challenge/utility/app_colors.dart';

class AddEditAlbum extends StatefulWidget {
  @override
  _AddEditAlbumState createState() => _AddEditAlbumState();
}

class _AddEditAlbumState extends State<AddEditAlbum> {
  Album album;
  bool isEdit = false;
  final AlbumController _albumController = Get.find();

  TextEditingController _albumTitleTextController;
  TextEditingController _albumURLTextController;

  @override
  void initState() {
    super.initState();
    album = Get.arguments;
    _albumTitleTextController = TextEditingController();
    _albumURLTextController = TextEditingController();

    if (album != null) {
      isEdit = true;
      _albumTitleTextController.text = album.title;
      _albumURLTextController.text = album.url;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isEdit ? Text('Edit Album') : Text('Add Album'),
      ),
      backgroundColor: colorBackground,
      body: bodyOfPage(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        String url = _albumURLTextController.value.text;
        String title = _albumTitleTextController.value.text;
        if (!GetUtils.isNullOrBlank(title) && GetUtils.isURL(url)) {
          if (isEdit) {
            album.title = title;
            album.url = url;
            album.thumbnailUrl = url;
            _albumController.editItem(album);

            //Get.offNamedUntil(routeHome, (route) => false);
            Get.until((route) => Get.currentRoute == routeHome);
          } else {
            _albumController.addItem(url, title);
            Get.back();
          }
        } else {
          _showToast();
        }
      },
      child: Icon(Icons.done),
    );
  }

  void _showToast() {
    Fluttertoast.showToast(
        msg: "Please fill all details correctly.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Card bodyOfPage() {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _albumURLTextController,
                style: TextStyle(fontSize: 14),
                decoration: new InputDecoration(
                  hintText: 'Album Cover URL',
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _albumTitleTextController,
                style: TextStyle(fontSize: 14),
                decoration: new InputDecoration(
                  hintText: 'Album Title',
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
