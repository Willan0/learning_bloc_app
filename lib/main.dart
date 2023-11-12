import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learning_bloc_app/welcome/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return const MaterialApp(
        title: 'Bloc Test',
        debugShowCheckedModeBanner: false,
        home:  Welcome(),
      );
    });
  }
}