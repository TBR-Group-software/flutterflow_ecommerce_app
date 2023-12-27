import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/cart/cart_app_bar/cart_app_bar_widget.dart';
import '/cart/cart_bottom_bar/cart_bottom_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_page_model.dart';
export 'cart_page_model.dart';

class CartPageWidget extends StatefulWidget {
  const CartPageWidget({Key? key}) : super(key: key);

  @override
  _CartPageWidgetState createState() => _CartPageWidgetState();
}

class _CartPageWidgetState extends State<CartPageWidget> {
  late CartPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartPageModel());
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
        body: Container(
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<CartRecord>>(
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
                      List<CartRecord> cartAppBarCartRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final cartAppBarCartRecord =
                          cartAppBarCartRecordList.isNotEmpty
                              ? cartAppBarCartRecordList.first
                              : null;
                      return wrapWithModel(
                        model: _model.cartAppBarModel,
                        updateCallback: () => setState(() {}),
                        child: CartAppBarWidget(
                          cartDoc: cartAppBarCartRecord!,
                        ),
                      );
                    },
                  ),
                  StreamBuilder<List<CartRecord>>(
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
                      List<CartRecord> containerCartRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final containerCartRecord =
                          containerCartRecordList.isNotEmpty
                              ? containerCartRecordList.first
                              : null;
                      return Container(
                        height: 700.0,
                        decoration: BoxDecoration(),
                        child: StreamBuilder<List<CartContentRecord>>(
                          stream: queryCartContentRecord(
                            queryBuilder: (cartContentRecord) =>
                                cartContentRecord.where(
                              'cart_id',
                              isEqualTo: containerCartRecord?.reference.id,
                            ),
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
                            List<CartContentRecord>
                                listViewCartContentRecordList = snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                200.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewCartContentRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewCartContentRecord =
                                    listViewCartContentRecordList[
                                        listViewIndex];
                                return Builder(
                                  builder: (context) {
                                    if (listViewIndex >
                                        listViewCartContentRecord.ammount) {
                                      return Container(
                                        width: double.infinity,
                                        height: 120.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    listViewCartContentRecord
                                                        .image,
                                                    width: 80.0,
                                                    height: 80.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 200.0,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        flex: 1,
                                                        child: Text(
                                                          listViewCartContentRecord
                                                              .text,
                                                          maxLines: 3,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '\$${listViewCartContentRecord.price.toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await listViewCartContentRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'ammount':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              },
                                                            ),
                                                          });

                                                          await containerCartRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'price': FieldValue
                                                                    .increment(
                                                                        listViewCartContentRecord
                                                                            .price),
                                                              },
                                                            ),
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .add_circle_outline_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 26.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          listViewCartContentRecord
                                                              .ammount
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (listViewCartContentRecord
                                                                  .ammount ==
                                                              1) {
                                                            await containerCartRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'price': FieldValue
                                                                      .increment(
                                                                          -(listViewCartContentRecord
                                                                              .price)),
                                                                  'content':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    listViewCartContentRecord
                                                                        .reference
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                            await listViewCartContentRecord
                                                                .reference
                                                                .delete();
                                                          } else {
                                                            await containerCartRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'price': FieldValue
                                                                      .increment(
                                                                          -(listViewCartContentRecord
                                                                              .price)),
                                                                },
                                                              ),
                                                            });

                                                            await listViewCartContentRecord
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'ammount': FieldValue
                                                                      .increment(
                                                                          -(1)),
                                                                },
                                                              ),
                                                            });
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .remove_circle_outline_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 26.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 1.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 120.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      listViewCartContentRecord
                                                          .image,
                                                      width: 80.0,
                                                      height: 80.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 200.0,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child: Text(
                                                            listViewCartContentRecord
                                                                .text,
                                                            maxLines: 3,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      6.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            '\$${listViewCartContentRecord.price.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await listViewCartContentRecord
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'ammount':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                },
                                                              ),
                                                            });

                                                            await containerCartRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'price': FieldValue
                                                                      .increment(
                                                                          listViewCartContentRecord
                                                                              .price),
                                                                },
                                                              ),
                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .add_circle_outline_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            size: 26.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: Text(
                                                            listViewCartContentRecord
                                                                .ammount
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (listViewCartContentRecord
                                                                    .ammount ==
                                                                1) {
                                                              await containerCartRecord!
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'price': FieldValue.increment(
                                                                        -(listViewCartContentRecord
                                                                            .price)),
                                                                    'content':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      listViewCartContentRecord
                                                                          .reference
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                              await listViewCartContentRecord
                                                                  .reference
                                                                  .delete();
                                                            } else {
                                                              await containerCartRecord!
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'price': FieldValue.increment(
                                                                        -(listViewCartContentRecord
                                                                            .price)),
                                                                  },
                                                                ),
                                                              });

                                                              await listViewCartContentRecord
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'ammount': FieldValue
                                                                        .increment(
                                                                            -(1)),
                                                                  },
                                                                ),
                                                              });
                                                            }
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .remove_circle_outline_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            size: 26.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
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
                    List<CartRecord> cartBottomBarCartRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final cartBottomBarCartRecord =
                        cartBottomBarCartRecordList.isNotEmpty
                            ? cartBottomBarCartRecordList.first
                            : null;
                    return wrapWithModel(
                      model: _model.cartBottomBarModel,
                      updateCallback: () => setState(() {}),
                      child: CartBottomBarWidget(
                        totalPrice: cartBottomBarCartRecord!.price,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
