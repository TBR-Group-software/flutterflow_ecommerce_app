// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({
    Key? key,
    this.width,
    this.height,
    this.start = 0,
    this.end = 100,
    this.activeColor,
    this.inactiveColor,
    this.trackheight = 4.0,
    this.onChanged,
  }) : super(key: key);

  final double? width, height, start, end, trackheight;
  final Color? activeColor, inactiveColor;
  final void Function()? onChanged;

  @override
  _RangeSliderWidgetState createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  double? startValue;
  double? endValue;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: widget.trackheight ?? 4.0,
      ),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: RangeSlider(
          activeColor: widget.activeColor,
          inactiveColor: widget.inactiveColor,
          values: RangeValues(
              startValue ?? widget.start ?? 0, endValue ?? widget.end ?? 100),
          max: widget.end ?? 100,
          onChanged: (RangeValues values) {
            setState(() {
              startValue = values.start;
              endValue = values.end;
            });
            FFAppState().filterPriceLower = (startValue ?? 0).round();
            FFAppState().filterPriceHigher = (endValue ?? 0).round();
            widget.onChanged?.call();
          },
        ),
      ),
    );
  }
}
