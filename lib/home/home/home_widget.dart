import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/catalogue/categories_bottom_sheet/categories_bottom_sheet_widget.dart';
import '/components/product_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/see_all/see_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 88.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'Catalogue',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Text',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.updatePage(() {
                      FFAppState().pageNumber = 2;
                    });
                  },
                  child: wrapWithModel(
                    model: _model.seeAllModel,
                    updateCallback: () => setState(() {}),
                    child: SeeAllWidget(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 88.0,
              decoration: BoxDecoration(),
              child: FutureBuilder<List<CatalogueRecord>>(
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
                  List<CatalogueRecord> listViewCatalogueRecordList =
                      snapshot.data!;
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: listViewCatalogueRecordList.length,
                    separatorBuilder: (_, __) => SizedBox(width: 16.0),
                    itemBuilder: (context, listViewIndex) {
                      final listViewCatalogueRecord =
                          listViewCatalogueRecordList[listViewIndex];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          width: 88.0,
                          height: 88.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                listViewCatalogueRecord.imageUrl,
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Opacity(
                            opacity: 0.8,
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
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.4,
                                        child: CategoriesBottomSheetWidget(
                                          title: listViewCatalogueRecord.title,
                                          catalogueId: listViewCatalogueRecord
                                              .reference.id,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Container(
                                width: 88.0,
                                height: 88.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      Color(0x3334283E)
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(-1.0, 0.0),
                                    end: AlignmentDirectional(1.0, 0),
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    listViewCatalogueRecord.title,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 0.0, 0.0),
              child: Text(
                'Featured',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'SF Pro Text',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 53.0),
              child: PagedGridView<DocumentSnapshot<Object?>?, ProductsRecord>(
                pagingController: _model.setGridViewController(
                  ProductsRecord.collection
                      .where(
                        'featured',
                        isEqualTo: true,
                      )
                      .orderBy('created_at', descending: true),
                ),
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 17.0,
                  mainAxisSpacing: 24.0,
                  childAspectRatio: 0.6,
                ),
                primary: false,
                scrollDirection: Axis.vertical,
                builderDelegate: PagedChildBuilderDelegate<ProductsRecord>(
                  // Customize what your widget looks like when it's loading the first page.
                  firstPageProgressIndicatorBuilder: (_) => Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  ),
                  // Customize what your widget looks like when it's loading another page.
                  newPageProgressIndicatorBuilder: (_) => Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  ),

                  itemBuilder: (context, _, gridViewIndex) {
                    final gridViewProductsRecord = _model
                        .gridViewPagingController!.itemList![gridViewIndex];
                    return ProductWidget(
                      key: Key(
                          'Key0np_${gridViewIndex}_of_${_model.gridViewPagingController!.itemList!.length}'),
                      discount: gridViewProductsRecord.discount,
                      image: gridViewProductsRecord.imagesUrl.first,
                      raiting: gridViewProductsRecord.raiting,
                      title: gridViewProductsRecord.title,
                      price: gridViewProductsRecord.price,
                      discountPrice: gridViewProductsRecord.discountPrice,
                      isFavorite: gridViewProductsRecord.inFavorites
                              .contains(currentUserUid) ==
                          true,
                      docRef: gridViewProductsRecord.reference,
                      doc: gridViewProductsRecord,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
