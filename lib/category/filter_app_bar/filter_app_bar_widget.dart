import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_app_bar_model.dart';
export 'filter_app_bar_model.dart';

class FilterAppBarWidget extends StatefulWidget {
  const FilterAppBarWidget({Key? key}) : super(key: key);

  @override
  _FilterAppBarWidgetState createState() => _FilterAppBarWidgetState();
}

class _FilterAppBarWidgetState extends State<FilterAppBarWidget> {
  late FilterAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterAppBarModel());
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
      height: 42.0,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 40.0,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
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
                    child: Text(
                      'Filter',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                Text(
                  'Clear',
                  style: FlutterFlowTheme.of(context).titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
