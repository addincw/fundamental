import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fundamental/topics/state_managements/provider/provider_page.dart';
// import 'package:fundamental/topics/state_managements/provider_multiple/provider_multiple_page.dart';
// import 'package:fundamental/topics/state_managements/bloc/bloc_page.dart';
// import 'package:fundamental/topics/state_managements/bloc/color_bloc.dart';
import 'package:fundamental/topics/state_managements/bloc_package/bloc_package_page.dart';
import 'package:fundamental/topics/state_managements/bloc_package/color_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fundamental',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<ColorBloc>(
        create: (BuildContext context) => ColorBloc(Colors.lightBlue),
        child: BlocPackagePage(),
      ),
    );
  }
}
