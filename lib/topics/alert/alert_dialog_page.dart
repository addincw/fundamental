import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  _showAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Alert Dialog Example'),
            content: Text('this is content alert dialog'),
            actions: [
              TextButton(onPressed: () {}, child: Text('confirm')),
            ],
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert - dialog')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Text('test'),
                Text('test'),
                Text('test'),
                Text('test'),
                Text('test'),
                Text('test'),
              ],
            ),
            Text('test'),
            Text('test'),
            Text('test'),
            Text('test'),
            Text('test'),
            Text('test'),
            Text('test'),
            Text('test'),
          ],
        ),
      ),
      bottomNavigationBar: TextButton(
        onPressed: () {
          _showAlertDialog(context);
        },
        child: Text('show alert'),
      ),
    );
  }
}
