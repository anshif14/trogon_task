import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/my_course/screens/change_course_screen.dart';

var height;
var width;

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return  MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeCourseScreen(),
    );
  }
}
