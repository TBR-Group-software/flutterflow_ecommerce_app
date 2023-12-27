import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_model.dart';
export 'product_model.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    Key? key,
    int? discount,
    required this.image,
    this.raiting,
    required this.title,
    required this.price,
    double? discountPrice,
    required this.isFavorite,
    required this.docRef,
    required this.doc,
  })  : this.discount = discount ?? 0,
        this.discountPrice = discountPrice ?? 0.0,
        super(key: key);

  final int discount;
  final String? image;
  final int? raiting;
  final String? title;
  final double? price;
  final double discountPrice;
  final bool? isFavorite;
  final DocumentReference? docRef;
  final ProductsRecord? doc;

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  late ProductModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'PorductPage',
          queryParameters: {
            'product': serializeParam(
              widget.doc,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'product': widget.doc,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: AlignmentDirectional(0.0, 1.0),
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 163.0,
                      height: 163.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            widget.image!,
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Visibility(
                        visible: widget.discount > 0,
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Container(
                              width: 47.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFD23A3A),
                                    Color(0xFFF49763)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(-1.0, 0.0),
                                  end: AlignmentDirectional(1.0, 0),
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(40.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(40.0),
                                ),
                                shape: BoxShape.rectangle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '-${widget.discount.toString()}%',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Text',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: RatingBarIndicator(
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.of(context).accent2,
                        ),
                        direction: Axis.horizontal,
                        rating: widget.raiting!.toDouble(),
                        unratedColor: FlutterFlowTheme.of(context).alternate,
                        itemCount: 5,
                        itemSize: 9.0,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                    child: Container(
                      width: 36.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12.0,
                            color: Color(0x1434283E),
                            offset: Offset(0.0, 4.0),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: Builder(
                        builder: (context) {
                          if (widget.isFavorite ?? false) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await widget.docRef!.update({
                                  ...mapToFirestore(
                                    {
                                      'in_favorites': FieldValue.arrayRemove(
                                          [currentUserUid]),
                                    },
                                  ),
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/favorite_on.svg',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            );
                          } else {
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await widget.docRef!.update({
                                  ...mapToFirestore(
                                    {
                                      'in_favorites': FieldValue.arrayUnion(
                                          [currentUserUid]),
                                    },
                                  ),
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/favorite_off.svg',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Text(
                  widget.title!,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Text',
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Builder(
                builder: (context) {
                  if (widget.discountPrice == 0) {
                    return Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        '\$${widget.price?.toString()}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Text',
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    );
                  } else {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${widget.discountPrice.toString()}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'SF Pro Text',
                                    color: FlutterFlowTheme.of(context).accent3,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Text(
                            '\$${widget.price?.toString()}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'SF Pro Text',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  decoration: TextDecoration.lineThrough,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
