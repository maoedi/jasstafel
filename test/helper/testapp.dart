import 'package:flutter/material.dart';
import 'package:jasstafel/common/localization.dart';

class JasstafelTestApp extends MaterialApp {
  JasstafelTestApp({super.key, child})
      : super(
            theme: ThemeData(
                brightness: Brightness.dark, canvasColor: Colors.black),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              return supportedLocales.first;
            },
            home: Material(child: child));
}

Widget makeTestable(widget) {
  return JasstafelTestApp(
      child: Flex(direction: Axis.horizontal, children: [widget]));
}

Widget makeTestableExpanded(widget) {
  return makeTestable(Expanded(child: widget));
}
