import '/backend/backend.dart';
import '/catalogue/categories_bottom_sheet/categories_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'catalogue_model.dart';
export 'catalogue_model.dart';

class CatalogueWidget extends StatefulWidget {
  const CatalogueWidget({Key? key}) : super(key: key);

  @override
  _CatalogueWidgetState createState() => _CatalogueWidgetState();
}

class _CatalogueWidgetState extends State<CatalogueWidget> {
  late CatalogueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CatalogueModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<CatalogueRecord>>(
      future: queryCatalogueRecordOnce(
        queryBuilder: (catalogueRecord) =>
            catalogueRecord.orderBy('created_at'),
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
        List<CatalogueRecord> listViewCatalogueRecordList = snapshot.data!;
        return ListView.separated(
          padding: EdgeInsets.fromLTRB(
            0,
            104.0,
            0,
            98.0,
          ),
          scrollDirection: Axis.vertical,
          itemCount: listViewCatalogueRecordList.length,
          separatorBuilder: (_, __) => SizedBox(height: 16.0),
          itemBuilder: (context, listViewIndex) {
            final listViewCatalogueRecord =
                listViewCatalogueRecordList[listViewIndex];
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          child: CategoriesBottomSheetWidget(
                            title: listViewCatalogueRecord.title,
                            catalogueId: listViewCatalogueRecord.reference.id,
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 88.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Text(
                                listViewCatalogueRecord.title,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                          Image.network(
                            listViewCatalogueRecord.imageUrl,
                            width: 88.0,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
