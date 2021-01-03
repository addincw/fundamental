import 'package:flutter/material.dart';
import 'package:fundamental/topics/state_managements/bloc/color_bloc.dart';

class BlocPage extends StatefulWidget {
  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  ColorBloc colorBloc = ColorBloc();

  @override
  void dispose() {
    colorBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('State Management - Bloc')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: colorBloc.stateStream,
              initialData: Colors.lightBlue,
              builder: (
                BuildContext context,
                AsyncSnapshot<Color> snapshot,
              ) {
                return AnimatedContainer(
                  height: 110,
                  width: 110,
                  color: snapshot.data,
                  duration: Duration(milliseconds: 500),
                );
              },
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  color: Colors.amber,
                  onPressed: () {
                    colorBloc.eventSink.add(ColorEvent.to_amber);
                  },
                  child: Text('To Amber'),
                ),
                SizedBox(width: 12),
                FlatButton(
                  color: Colors.lightBlue,
                  onPressed: () {
                    colorBloc.eventSink.add(ColorEvent.to_light_blue);
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
