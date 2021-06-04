import 'package:flutter/material.dart';

import 'package:ps_i1/models/user.dart';

import 'package:ps_i1/pages/access_control/denied.dart';
import 'package:ps_i1/pages/access_control/not_logged.dart';

class AccessController extends StatelessWidget {
  final User? currentState;
  final Type? targetState;
  final Scaffold targetPage;

  const AccessController({
    required this.currentState,
    required this.targetState,
    required this.targetPage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentState.runtimeType == targetState) return targetPage;
    if (currentState == null) return const NotLogged();
    return const Denied();
  }
}
