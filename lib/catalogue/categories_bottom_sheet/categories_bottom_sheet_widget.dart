import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'categories_bottom_sheet_model.dart';
export 'categories_bottom_sheet_model.dart';

class CategoriesBottomSheetWidget extends StatefulWidget {
  const CategoriesBottomSheetWidget({
    Key? key,
    String? title,
    required this.catalogueId,
  })  : this.title = title ?? '',
        super(key: key);

  final String title;
  final String? catalogueId;

  @override
  _CategoriesBottomSheetWidgetState createState() =>
      _CategoriesBottomSheetWidgetState();
}

class _CategoriesBottomSheetWidgetState
    extends State<CategoriesBottomSheetWidget> {
  late CategoriesBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesBottomSheetModel());
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
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Container(
              width: 60.0,
              height: 5.0,
              decoration: BoxDecoration(
                color: Color(0xFFE3E3E3),
                borderRadius: BorderRadius.circular(45.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              widget.title,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'SF Pro Text',
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
            child: FutureBuilder<List<CategoriesRecord>>(
              future: queryCategoriesRecordOnce(
                queryBuilder: (categoriesRecord) => categoriesRecord
                    .where(
                      'catalogue_id',
                      isEqualTo: widget.catalogueId,
                    )
                    .orderBy('created_at'),
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
                List<CategoriesRecord> listViewCategoriesRecordList =
                    snapshot.data!;
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewCategoriesRecordList.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.0),
                  itemBuilder: (context, listViewIndex) {
                    final listViewCategoriesRecord =
                        listViewCategoriesRecordList[listViewIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(
                            context, listViewCategoriesRecord.reference.id);

                        context.pushNamed(
                          'CategoryPage',
                          queryParameters: {
                            'title': serializeParam(
                              listViewCategoriesRecord.title,
                              ParamType.String,
                            ),
                            'category': serializeParam(
                              listViewCategoriesRecord,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'category': listViewCategoriesRecord,
                          },
                        );
                      },
                      child: Text(
                        listViewCategoriesRecord.title,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              useGoogleFonts: false,
                            ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
