import 'package:flutter/material.dart';

class Denied extends StatelessWidget {
  const Denied({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ops, alguém se perdeu...'),
      ),
      body: Center(
        child: Column(
          children: const [
            Icon(
              Icons.lock,
              size: 40.0,
            ),
            Divider(
              color: Colors.transparent,
              height: 20.0,
            ),
            Text('Parece que você não tem acesso à isso!'),
          ],
        ),
      ),
    );
  }
}
