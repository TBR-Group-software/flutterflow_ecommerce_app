import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'see_all_model.dart';
export 'see_all_model.dart';

class SeeAllWidget extends StatefulWidget {
  const SeeAllWidget({Key? key}) : super(key: key);

  @override
  _SeeAllWidgetState createState() => _SeeAllWidgetState();
}

class _SeeAllWidgetState extends State<SeeAllWidget> {
  late SeeAllModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeeAllModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'See All',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'SF Pro Text',
                color: FlutterFlowTheme.of(context).primaryBackground,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                useGoogleFonts: false,
              ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: SvgPicture.asset(
            'assets/images/vector.svg',
            width: 16.0,
            height: 16.0,
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    );
  }
}
