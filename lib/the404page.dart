import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class The404Page extends StatelessWidget {
  const The404Page({Key? key, @required this.desiredRoute}) : super(key: key);

  final String? desiredRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Route Not Found")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const Text("Route Not Found:"), Text(desiredRoute ?? "")],
      )),
    );
  }
}
