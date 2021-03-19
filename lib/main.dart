import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/second.dart';
import 'pages/file.dart';
// import 'componentes/menu.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp()); /*1*/
}

class MyApp extends StatelessWidget {/*2*/
  // var menu = new MenuComponent();
  @override
  Widget build(BuildContext context) { /*3*/
    return MaterialApp(
      home: HomePage(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => new HomePage(),
        '/subpage': (BuildContext context) => new UploadPage(),
      },
    );
  }
}
