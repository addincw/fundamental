import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundamental/topics/state_managements/bloc_package/color_bloc.dart';

class BlocPackagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('State Management - Bloc Package')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ColorBloc, Color>(
              builder: (BuildContext context, currentColor) =>
                  AnimatedContainer(
                height: 110,
                width: 110,
                color: currentColor,
                duration: Duration(milliseconds: 500),
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  color: Colors.amber,
                  onPressed: () {
                    colorBloc.add(ColorEvent.to_amber);
                  },
                  child: Text('To Amber'),
                ),
                SizedBox(width: 12),
                FlatButton(
                  color: Colors.lightBlue,
                  onPressed: () {
                    colorBloc.add(ColorEvent.to_light_blue);
                  },
                  child: Text('To Light Blue'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
