import 'package:flutter/material.dart';
import 'package:flutter_interview_task/view/pages/home_page.dart';
import 'package:sizer/sizer.dart';

import 'controller/constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'MovieApp',
        theme: CustomTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      );
    });
  }
}
