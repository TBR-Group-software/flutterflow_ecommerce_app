import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_bottom_bar_model.dart';
export 'product_bottom_bar_model.dart';

class ProductBottomBarWidget extends StatefulWidget {
  const ProductBottomBarWidget({
    Key? key,
    required this.product,
    required this.cart,
  }) : super(key: key);

  final ProductsRecord? product;
  final DocumentReference? cart;

  @override
  _ProductBottomBarWidgetState createState() => _ProductBottomBarWidgetState();
}

class _ProductBottomBarWidgetState extends State<ProductBottomBarWidget> {
  late ProductBottomBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductBottomBarModel());
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
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
            Flexible(
              flex: 3,
              child: FFButtonWidget(
                onPressed: () async {
                  var cartContentRecordReference =
                      CartContentRecord.collection.doc();
                  await cartContentRecordReference
                      .set(createCartContentRecordData(
                    cartId: widget.cart?.id,
                    price: widget.product?.price,
                    image: widget.product?.imagesUrl?.first,
                    ammount: 1,
                    text: widget.product?.title,
                  ));
                  _model.newCartContent = CartContentRecord.getDocumentFromData(
                      createCartContentRecordData(
                        cartId: widget.cart?.id,
                        price: widget.product?.price,
                        image: widget.product?.imagesUrl?.first,
                        ammount: 1,
                        text: widget.product?.title,
                      ),
                      cartContentRecordReference);

                  await widget.cart!.update({
                    ...mapToFirestore(
                      {
                        'content': FieldValue.arrayUnion(
                            [_model.newCartContent?.reference]),
                        'price': FieldValue.increment(widget.product!.price),
                      },
                    ),
                  });
                  context.safePop();

                  setState(() {});
                },
                text: 'Add to Cart',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).accent1,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'SF Pro Display',
                        color: Colors.white,
                        useGoogleFonts: false,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Builder(
              builder: (context) {
                if (widget.product?.inFavorites?.contains(currentUserUid) ==
                    true) {
                  return FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.favorite_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await widget.product!.reference.update({
                        ...mapToFirestore(
                          {
                            'in_favorites':
                                FieldValue.arrayRemove([currentUserUid]),
                          },
                        ),
                      });
                    },
                  );
                } else {
                  return FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.favorite_border,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await widget.product!.reference.update({
                        ...mapToFirestore(
                          {
                            'in_favorites':
                                FieldValue.arrayUnion([currentUserUid]),
                          },
                        ),
                      });
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
