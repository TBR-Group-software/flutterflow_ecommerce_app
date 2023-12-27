import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'checkout_shipping_address_model.dart';
export 'checkout_shipping_address_model.dart';

class CheckoutShippingAddressWidget extends StatefulWidget {
  const CheckoutShippingAddressWidget({Key? key}) : super(key: key);

  @override
  _CheckoutShippingAddressWidgetState createState() =>
      _CheckoutShippingAddressWidgetState();
}

class _CheckoutShippingAddressWidgetState
    extends State<CheckoutShippingAddressWidget> {
  late CheckoutShippingAddressModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutShippingAddressModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 20.0,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Oleh Chabanov',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                      Spacer(),
                      Text(
                        'Change',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Text(
                      '225 Highland Ave\nSpringfield, IL 62704, USA',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
