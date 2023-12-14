import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_bloc_app/welcome/bloc/welcome_bloc.dart';

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
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => WelcomeBloc(),
          )
        ],
        child: const MaterialApp(
          title: 'Bloc Test',
          debugShowCheckedModeBanner: false,
          home: Welcome(),
        ),
      );
    });
  }
}
