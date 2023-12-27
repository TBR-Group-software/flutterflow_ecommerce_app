import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_app_bar_model.dart';
export 'home_app_bar_model.dart';

class HomeAppBarWidget extends StatefulWidget {
  const HomeAppBarWidget({Key? key}) : super(key: key);

  @override
  _HomeAppBarWidgetState createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  late HomeAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeAppBarModel());
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
      height: 88.0,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 66.0,
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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.asset(
                        'assets/images/menu.svg',
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: RichText(
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'My',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                              TextSpan(
                                text: 'Shop',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18.0,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  letterSpacing: 2.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.asset(
                        'assets/images/bell.svg',
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
