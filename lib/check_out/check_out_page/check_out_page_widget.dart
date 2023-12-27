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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'check_out_page_model.dart';
export 'check_out_page_model.dart';

class CheckOutPageWidget extends StatefulWidget {
  const CheckOutPageWidget({Key? key}) : super(key: key);

  @override
  _CheckOutPageWidgetState createState() => _CheckOutPageWidgetState();
}

class _CheckOutPageWidgetState extends State<CheckOutPageWidget> {
  late CheckOutPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckOutPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF4F3F4),
        appBar: FFAppState().pageNumber != 4
            ? AppBar(
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).secondary
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(-1.0, 0.0),
                        end: AlignmentDirectional(1.0, 0),
                      ),
                    ),
                  ),
                ),
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.checkoutAppBarModel,
                  updateCallback: () => setState(() {}),
                  child: CheckoutAppBarWidget(),
                ),
                Container(
                  height: 600.0,
                  decoration: BoxDecoration(),
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      24.0,
                      0,
                      24.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Shipping Address',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: wrapWithModel(
                          model: _model.checkoutShippingAddressModel,
                          updateCallback: () => setState(() {}),
                          child: CheckoutShippingAddressWidget(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 33.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.truck,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Delivery Method',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120.0,
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.checkoutDeliveryMethodModel,
                          updateCallback: () => setState(() {}),
                          child: CheckoutDeliveryMethodWidget(
                            selectedIndex: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 33.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.creditCard,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Payment Method',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: wrapWithModel(
                          model: _model.checkoutPaymentMethodModel,
                          updateCallback: () => setState(() {}),
                          child: CheckoutPaymentMethodWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: StreamBuilder<List<CartRecord>>(
                stream: queryCartRecord(
                  queryBuilder: (cartRecord) => cartRecord.where(
                    'user_id',
                    isEqualTo: currentUserUid,
                  ),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<CartRecord> checkoutBottomBarCartRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final checkoutBottomBarCartRecord =
                      checkoutBottomBarCartRecordList.isNotEmpty
                          ? checkoutBottomBarCartRecordList.first
                          : null;
                  return wrapWithModel(
                    model: _model.checkoutBottomBarModel,
                    updateCallback: () => setState(() {}),
                    child: CheckoutBottomBarWidget(
                      totalPrice: 257.98,
                      itemsPrice: checkoutBottomBarCartRecord!.price,
                      delivery: 18.0,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
