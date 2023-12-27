import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/check_out/checkout_app_bar/checkout_app_bar_widget.dart';
import '/check_out/checkout_bottom_bar/checkout_bottom_bar_widget.dart';
import '/check_out/checkout_delivery_method/checkout_delivery_method_widget.dart';
import '/check_out/checkout_payment_method/checkout_payment_method_widget.dart';
import '/check_out/checkout_shipping_address/checkout_shipping_address_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'check_out_page_widget.dart' show CheckOutPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckOutPageModel extends FlutterFlowModel<CheckOutPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CheckoutAppBar component.
  late CheckoutAppBarModel checkoutAppBarModel;
  // Model for CheckoutShippingAddress component.
  late CheckoutShippingAddressModel checkoutShippingAddressModel;
  // Model for CheckoutDeliveryMethod component.
  late CheckoutDeliveryMethodModel checkoutDeliveryMethodModel;
  // Model for CheckoutPaymentMethod component.
  late CheckoutPaymentMethodModel checkoutPaymentMethodModel;
  // Model for CheckoutBottomBar component.
  late CheckoutBottomBarModel checkoutBottomBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    checkoutAppBarModel = createModel(context, () => CheckoutAppBarModel());
    checkoutShippingAddressModel =
        createModel(context, () => CheckoutShippingAddressModel());
    checkoutDeliveryMethodModel =
        createModel(context, () => CheckoutDeliveryMethodModel());
    checkoutPaymentMethodModel =
        createModel(context, () => CheckoutPaymentMethodModel());
    checkoutBottomBarModel =
        createModel(context, () => CheckoutBottomBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    checkoutAppBarModel.dispose();
    checkoutShippingAddressModel.dispose();
    checkoutDeliveryMethodModel.dispose();
    checkoutPaymentMethodModel.dispose();
    checkoutBottomBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
