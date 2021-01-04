import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

enum ColorEvent { to_amber, to_light_blue }

class ColorBloc extends HydratedBloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.lightBlue);

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    switch (event) {
      case ColorEvent.to_amber:
        yield Colors.amber;
        break;
      case ColorEvent.to_light_blue:
        yield Colors.lightBlue;
        break;
    }
  }

// method untuk load data
  @override
  Color fromJson(Map<String, dynamic> json) {
    try {
      return Color(json['color'] as int);
    } catch (e) {
      return null;
    }
  }

// method untuk write data
  @override
  Map<String, int> toJson(Color state) {
    try {
      return {'color': state.value};
    } catch (e) {
      return null;
    }
  }
}
