import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Hatch Demo',
    //  theme: ThemeData(
    //    primarySwatch: Colors.blue,
    //    visualDensity: VisualDensity.adaptivePlatformDensity,
    //  ),
     home: UploadPhotoPage(),
   );
 }
}

class UploadPhotoPage extends StatefulWidget {
 @override
 _UploadPhotoPageState createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
 File _image;
 final picker = ImagePicker();

 Future getImageFromCamera() async {
   final pickedFile = await picker.getImage(source: ImageSource.camera);

   setState(() {
     _image = File(pickedFile.path);
   });
 }

 Future getImageFromGallery() async {
   final pickedFile = await picker.getImage(source: ImageSource.gallery);

   setState(() {
     _image = File(pickedFile.path);
   });
 }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Image Picker Demo'),
     ),
     body: Center(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
                 width: 300,
                 child: _image == null
                     ? Text('No image selected.')
                     : Image.file(_image)),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               FloatingActionButton(
                 onPressed: getImageFromCamera,
                 tooltip: 'Pick Image From Camera',
                 child: Icon(Icons.add_a_photo),
               ),
               FloatingActionButton(
                 onPressed: getImageFromGallery,
                 tooltip: 'Pick Image From Gallery',
                 child: Icon(Icons.photo_library),
               ),
             ],
           )
         ],
       ),
     ),
   );
 }
}