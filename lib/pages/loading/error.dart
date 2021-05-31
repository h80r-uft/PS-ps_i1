import 'package:flutter/material.dart';

import 'package:ps_i1/theme/theme.dart' as theme;

class Error extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const Error(this.snapshot, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.purplePlanning(),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.close,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(snapshot.error.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
