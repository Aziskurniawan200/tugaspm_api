import 'package:flutter/material.dart';
import 'package:latihan/layout/home/gridViewLearning.dart';
import 'package:latihan/layout/home/homepagewithmenu.dart';
import 'package:latihan/layout/home/listViewLearning.dart';
import 'package:latihan/layout/home/myHomepage.dart';
import 'package:latihan/layout/home/newspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomepage(),
        '/gridview': (context) => const GridViewLearning(),
        '/listview': (context) => const ListViewLearning(),
        '/menu': (context) => const HomepageWithMenu(),
        '/newspage': (context) => const Newspage(),
      },
    );
  }
}
