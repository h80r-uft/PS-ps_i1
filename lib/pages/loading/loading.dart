import 'package:flutter/material.dart';

import 'package:ps_i1/theme/theme.dart' as theme;

class Loading extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const Loading(this.snapshot, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.purplePlanning(),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(
                backgroundColor: Colors.black,
                value: null,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(snapshot.connectionState.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
