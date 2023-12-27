import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_app_bar_model.dart';
export 'cart_app_bar_model.dart';

class CartAppBarWidget extends StatefulWidget {
  const CartAppBarWidget({
    Key? key,
    required this.cartDoc,
  }) : super(key: key);

  final CartRecord? cartDoc;

  @override
  _CartAppBarWidgetState createState() => _CartAppBarWidgetState();
}

class _CartAppBarWidgetState extends State<CartAppBarWidget> {
  late CartAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartAppBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Container(
        width: double.infinity,
        height: 44.0,
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.asset(
                        'assets/images/back.svg',
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Cart',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'SF Pro Display',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      setState(() {
                        _model.cartItemsAmmount =
                            widget.cartDoc?.content?.length;
                      });

                      await widget.cartDoc!.reference.update({
                        ...createCartRecordData(
                          price: 0.0,
                        ),
                        ...mapToFirestore(
                          {
                            'content': FieldValue.delete(),
                          },
                        ),
                      });
                      _model.cartItems = await queryCartContentRecordOnce(
                        queryBuilder: (cartContentRecord) =>
                            cartContentRecord.where(
                          'cart_id',
                          isEqualTo: widget.cartDoc?.reference.id,
                        ),
                      );
                      while (
                          _model.currentIteration! < _model.cartItemsAmmount!) {
                        await _model
                            .cartItems![_model.currentIteration!].reference
                            .delete();
                        setState(() {
                          _model.currentIteration =
                              _model.currentIteration! + 1;
                        });
                      }

                      setState(() {});
                    },
                    child: Text(
                      'Delete',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
