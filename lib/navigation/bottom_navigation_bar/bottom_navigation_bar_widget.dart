import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation_bar_model.dart';
export 'bottom_navigation_bar_model.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget>
    with TickerProviderStateMixin {
  late BottomNavigationBarModel _model;

  final animationsMap = {
    'columnOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavigationBarModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 66.0,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Container(
              width: double.infinity,
              height: 53.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15.0,
                    color: Color(0x0E000000),
                    offset: Offset(5.0, 0.0),
                    spreadRadius: 0.0,
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.updatePage(() {
                          FFAppState().pageNumber = 1;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 53.0,
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            if (FFAppState().pageNumber == 1) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/home_icon_filled.svg',
                                        width: double.infinity,
                                        height: 200.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 8.0),
                                    child: Text(
                                      'Home',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/home_icon.svg',
                                        width: double.infinity,
                                        height: 200.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 8.0),
                                    child: Text(
                                      'Home',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
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
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.updatePage(() {
                          FFAppState().pageNumber = 2;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 53.0,
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            if (FFAppState().pageNumber == 2) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/catalogue_icon_filled.svg',
                                        width: double.infinity,
                                        height: 200.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 8.0),
                                    child: Text(
                                      'Catalogue',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/catalogue_icon.svg',
                                        width: double.infinity,
                                        height: 200.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 8.0),
                                    child: Text(
                                      'Catalogue',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
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
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.updatePage(() {
                          FFAppState().pageNumber = 3;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 53.0,
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            if (FFAppState().pageNumber == 3) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/favorite_icon_filled.svg',
                                        width: double.infinity,
                                        height: 200.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 8.0),
                                    child: Text(
                                      'Favorite',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/favorite_icon.svg',
                                        width: double.infinity,
                                        height: 200.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 8.0),
                                    child: Text(
                                      'Favorite',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
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
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.updatePage(() {
                          FFAppState().pageNumber = 4;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 53.0,
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            if (FFAppState().pageNumber == 4) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/profile_icon_filled.svg',
                                        width: double.infinity,
                                        height: 200.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 8.0),
                                    child: Text(
                                      'Profile',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/profile_icon.svg',
                                        width: double.infinity,
                                        height: 200.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 8.0),
                                    child: Text(
                                      'Profile',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
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
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeIn,
                    width: FFAppState().cartOpened ? 116.0 : 50.0,
                    height: 53.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.0, -1.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (!FFAppState().cartOpened) {
                  setState(() {
                    FFAppState().cartOpened = true;
                  });
                } else {
                  context.pushNamed('CartPage');

                  return;
                }

                if (animationsMap['columnOnActionTriggerAnimation'] != null) {
                  await animationsMap['columnOnActionTriggerAnimation']!
                      .controller
                      .forward(from: 0.0);
                }
                await Future.delayed(const Duration(milliseconds: 3000));
                _model.updatePage(() {
                  FFAppState().cartOpened = false;
                });
                if (animationsMap['columnOnActionTriggerAnimation'] != null) {
                  await animationsMap['columnOnActionTriggerAnimation']!
                      .controller
                      .reverse();
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 600),
                curve: Curves.easeIn,
                width: FFAppState().cartOpened ? 116.0 : 50.0,
                height: 56.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).secondary
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(-1.0, 0.34),
                    end: AlignmentDirectional(1.0, -0.34),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(80.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 2.0),
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
                              List<CartRecord> textCartRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final textCartRecord =
                                  textCartRecordList.isNotEmpty
                                      ? textCartRecordList.first
                                      : null;
                              return Text(
                                '\$${formatNumber(
                                  textCartRecord?.price,
                                  formatType: FormatType.custom,
                                  format: '##0.00',
                                  locale: '',
                                )}',
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
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
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
                              List<CartRecord> textCartRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final textCartRecord =
                                  textCartRecordList.isNotEmpty
                                      ? textCartRecordList.first
                                      : null;
                              return Text(
                                '${textCartRecord?.content?.length?.toString()} items',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Text',
                                      color: Color(0x98FFFFFF),
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              );
                            },
                          ),
                        ),
                      ],
                    ).animateOnActionTrigger(
                      animationsMap['columnOnActionTriggerAnimation']!,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
