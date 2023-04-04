import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pref/pref.dart';

/// A widget that disables its preference children depending on a preference value
class PrefDisablerGeneric<T> extends StatefulWidget {
  /// create a Disabler widget
  const PrefDisablerGeneric({
    Key? key,
    required this.children,
    required this.pref,
    required this.nullValue,
    this.reversed = false,
  }) : super(key: key);

  /// The widgets to hide
  final List<Widget> children;

  /// The preference key
  final String pref;

  /// reverse the behavior
  final bool reversed;

  /// the fallback value if the pref value is null
  final T? nullValue;

  @override
  PrefDisablerGenericState<T> createState() => PrefDisablerGenericState<T>();
}

class PrefDisablerGenericState<T> extends State<PrefDisablerGeneric<T>> {
  @override
  void didChangeDependencies() {
    PrefService.of(context).addKeyListener(widget.pref, _onNotify);
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    PrefService.of(context).removeKeyListener(widget.pref, _onNotify);
    super.deactivate();
  }

  @override
  void reassemble() {
    PrefService.of(context).addKeyListener(widget.pref, _onNotify);
    super.reassemble();
  }

  void _onNotify() {
    setState(() {});
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    final dynamic value = PrefService.of(context).get<dynamic>(widget.pref);
    properties.add(DiagnosticsProperty(
      'pref',
      value,
      description: '${widget.pref} = $value',
    ));
  }

  @override
  Widget build(BuildContext context) {
    int? value;

    try {
      value = PrefService.of(context).get(widget.pref);
    } catch (e) {
      // logger.severe('Unable to load the value', e, s);
    }

    return PrefDisableState(
      disabled: (value == widget.nullValue) != widget.reversed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.children,
      ),
    );
  }
}
