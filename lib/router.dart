import 'package:deeplink_demo/parsed_params_page.dart';
import 'package:deeplink_demo/the404page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String start = '/';

  ///Generates a [List] of named [PageRoute]s
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print("App Path: ${settings.name}");

    var uri = Uri.parse(settings.name ?? "/");

    var id = uri.pathSegments.length == 2 ? uri.pathSegments[1] : null;

    Map<String, String> params = uri.queryParameters;
    print("Params:");
    print(params);

    if (uri.pathSegments.length == 1 && uri.pathSegments.first == 'passwordless') {
      if (params.containsKey("token") &&
          params.containsKey("userId") &&
          params.containsKey("shortCode") &&
          params.containsKey("targetRoute")) {
        return MaterialPageRoute(builder: (context) => ParsedParamsPage(queryParams: params));
      }
    }

    //handle basic named route cases
    switch (settings.name) {
      default:
        return MaterialPageRoute(builder: (context) => The404Page(desiredRoute: settings.name));
    }
  }
}
