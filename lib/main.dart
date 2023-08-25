import 'package:flutter/material.dart';
import 'package:note/pages/pag_addnote.dart';
import 'package:note/pages/page_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // هذه القطعة هي جذر التطبيق الخاص بك.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageHome(),
      routes: {"addnotes": (context) => Addnotes()},
    );
  }
}
