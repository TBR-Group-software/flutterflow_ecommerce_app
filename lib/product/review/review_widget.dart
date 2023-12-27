import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'review_model.dart';
export 'review_model.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({
    Key? key,
    required this.review,
  }) : super(key: key);

  final ReviewsRecord? review;

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  late ReviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewModel());
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
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 17.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 24.0,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Reviews',
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                widget.review!.userName,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            Container(
              width: double.infinity,
              height: 16.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  RatingBar.builder(
                    onRatingUpdate: (newValue) =>
                        setState(() => _model.ratingBarValue = newValue),
                    itemBuilder: (context, index) => Icon(
                      Icons.star_rounded,
                      color: FlutterFlowTheme.of(context).accent2,
                    ),
                    direction: Axis.horizontal,
                    initialRating: _model.ratingBarValue ??=
                        widget.review!.rating,
                    unratedColor: FlutterFlowTheme.of(context).alternate,
                    itemCount: 5,
                    itemSize: 12.0,
                    glowColor: FlutterFlowTheme.of(context).accent2,
                  ),
                  Spacer(),
                  Text(
                    dateTimeFormat('yMMMd', widget.review!.date!),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                widget.review!.text,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
              child: Text(
                '${widget.review?.foundHelpfulCount?.toString()} people found this helpful',
                maxLines: 5,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Container(
                height: 25.0,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Comment',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'SF Pro Display',
                            decoration: TextDecoration.underline,
                            useGoogleFonts: false,
                          ),
                    ),
                    Spacer(),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                      child: Text(
                        'Helpful',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (widget.review?.isHelpfull ?? false) {
                          return Icon(
                            Icons.thumb_up,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          );
                        } else {
                          return Icon(
                            Icons.thumb_up_off_alt,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
