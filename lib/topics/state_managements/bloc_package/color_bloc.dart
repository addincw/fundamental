import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { to_amber, to_light_blue }

class ColorBloc extends Bloc<ColorEvent, Color> {
  Color _color;

  ColorBloc(initialState) : super(initialState);

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    switch (event) {
      case ColorEvent.to_amber:
        _color = Colors.amber;
        break;
      case ColorEvent.to_light_blue:
        _color = Colors.lightBlue;
        break;
    }

    yield _color;
  }
}
