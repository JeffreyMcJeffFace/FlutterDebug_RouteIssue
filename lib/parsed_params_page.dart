import 'package:deeplink_demo/cubit/debug_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParsedParamsPage extends StatelessWidget {
  const ParsedParamsPage({Key? key, @required this.queryParams}) : super(key: key);

  final Map? queryParams;

  List<Widget> listParams() {
    var params = queryParams!.entries.map((e) => Text("${e.key} : ${e.value}")).toList();
    params.insert(0, const Text("Query Parameters:"));
    return params;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [Expanded(child: Column(children: listParams()))],
          ),
          Row(
            children: [
              Expanded(
                  child: Column(children: context.read<DebugCubit>().state.routeHistory.map((e) => Text(e)).toList()))
            ],
          )
        ],
      )),
    );
  }
}
