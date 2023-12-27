import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/cart/cart_app_bar/cart_app_bar_widget.dart';
import '/cart/cart_bottom_bar/cart_bottom_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cart_page_widget.dart' show CartPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPageModel extends FlutterFlowModel<CartPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CartAppBar component.
  late CartAppBarModel cartAppBarModel;
  // Model for CartBottomBar component.
  late CartBottomBarModel cartBottomBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cartAppBarModel = createModel(context, () => CartAppBarModel());
    cartBottomBarModel = createModel(context, () => CartBottomBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    cartAppBarModel.dispose();
    cartBottomBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
