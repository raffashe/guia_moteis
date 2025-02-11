import 'package:flutter/material.dart';
import 'package:guia_moteis/views/home_page.dart';

class AppGuiaMoteis extends StatelessWidget {
  const AppGuiaMoteis({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
