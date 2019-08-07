//import 'dart:io';
//
//import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//
/////拍照app页面
//class ImageAppPage extends StatefulWidget {
//  ImageAppPage({Key key}) : super(key: key);
//
//  _ImageAppPageState createState() => _ImageAppPageState();
//}
//
//class _ImageAppPageState extends State<ImageAppPage> {
//  List<File> _images = [];
//
//  Future getImage(bool isTakePhoto) async {
//    Navigator.pop(context);
//    var image = await ImagePicker.pickImage(
//        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);
//    if (image != null) {
//      setState(() {
//        _images.add(image);
//      });
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('拍照app'),
//      ),
//      body: Center(
//        child: Wrap(
//          spacing: 5,
//          runSpacing: 5,
//          children: _genImage(),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _pickImage,
//        tooltip: '选择图片',
//        child: Icon(Icons.add_a_photo),
//      ),
//    );
//  }
//
//  _pickImage() {
//    showModalBottomSheet(
//        context: context,
//        builder: (context) => Container(
//              height: 160,
//              child: Column(
//                children: <Widget>[
//                  _item('拍照', true),
//                  _item('从相册中选择', false),
//                ],
//              ),
//            ));
//  }
//
//  _item(String title, bool isTakePhoto) {
//    return GestureDetector(
//      child: ListTile(
//        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
//        title: Text(title),
//        onTap: () => getImage(isTakePhoto),
//      ),
//    );
//  }
//
//  _genImage() {
//    return _images.map((file) {
//      return Stack(
//        children: <Widget>[
//          ClipRRect(
//            //圆角
//            borderRadius: BorderRadius.circular(5),
//            child: Image.file(
//              file,
//              width: 120,
//              height: 90,
//              fit: BoxFit.fill,
//            ),
//          ),
//          Positioned(
//            right: 5,
//            top: 5,
//            child: GestureDetector(
//              onTap: () {
//                setState(() {
//                  _images.remove(file);
//                });
//              },
//              child: ClipOval(
//                child: Container(
//                  padding: EdgeInsets.all(3),
//                  decoration: BoxDecoration(
//                    color: Colors.black54,
//                  ),
//                  child: Icon(
//                    Icons.close,
//                    size: 18,
//                    color: Colors.white,
//                  ),
//                ),
//              ),
//            ),
//          )
//        ],
//      );
//    }).toList();
//  }
//}
