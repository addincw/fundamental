import 'package:flutter/material.dart';
import 'package:fundamental/topics/state_managements/provider/color_provider.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorProvider>(
      create: (BuildContext context) => ColorProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<ColorProvider>(
            builder: (BuildContext context, colorProvider, Widget child) {
              return Text(
                'State Management - Provider',
                style: TextStyle(color: colorProvider.color),
              );
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ColorProvider>(
                builder: (context, colorProvider, child) => AnimatedContainer(
                  height: 110,
                  width: 110,
                  color: colorProvider.color,
                  duration: Duration(milliseconds: 500),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('AB'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Consumer<ColorProvider>(
                      builder: (context, colorProvider, child) => Switch(
                        value: colorProvider.isLightBlue,
                        onChanged: (newValue) {
                          colorProvider.isLightBlue = newValue;
                        },
                      ),
                    ),
                  ),
                  Text('LB'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
