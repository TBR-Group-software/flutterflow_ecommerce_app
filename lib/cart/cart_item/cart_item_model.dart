import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'cart_item_widget.dart' show CartItemWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItemModel extends FlutterFlowModel<CartItemWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    instantTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
