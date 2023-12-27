import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/product_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'category_view_model.dart';
export 'category_view_model.dart';

class CategoryViewWidget extends StatefulWidget {
  const CategoryViewWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoriesRecord? category;

  @override
  _CategoryViewWidgetState createState() => _CategoryViewWidgetState();
}

class _CategoryViewWidgetState extends State<CategoryViewWidget> {
  late CategoryViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          height: 40.0,
          decoration: BoxDecoration(
            color: Color(0x00FFFFFF),
          ),
          child: StreamBuilder<List<ProductTypeRecord>>(
            stream: queryProductTypeRecord(),
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
              List<ProductTypeRecord> listViewProductTypeRecordList =
                  snapshot.data!;
              return ListView.separated(
                padding: EdgeInsets.fromLTRB(
                  16.0,
                  0,
                  16.0,
                  0,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: listViewProductTypeRecordList.length,
                separatorBuilder: (_, __) => SizedBox(width: 8.0),
                itemBuilder: (context, listViewIndex) {
                  final listViewProductTypeRecord =
                      listViewProductTypeRecordList[listViewIndex];
                  return Builder(
                    builder: (context) {
                      if (listViewProductTypeRecord.reference.id ==
                          FFAppState().firterProductTypeId) {
                        return FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: listViewProductTypeRecord.name,
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).accent1,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  color: Colors.white,
                                  useGoogleFonts: false,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        );
                      } else {
                        return FFButtonWidget(
                          onPressed: () async {
                            setState(() {
                              FFAppState().firterProductTypeId =
                                  listViewProductTypeRecord.reference.id;
                            });
                          },
                          text: listViewProductTypeRecord.name,
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  color: Colors.white,
                                  useGoogleFonts: false,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        );
                      }
                    },
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Builder(
                  builder: (context) {
                    if (valueOrDefault<bool>(
                      FFAppState().firterProductTypeId ==
                          '3IsjNApvCaUKWQyC0fl0',
                      false,
                    )) {
                      return FutureBuilder<int>(
                        future: queryProductsRecordCount(
                          queryBuilder: (productsRecord) => productsRecord
                              .where(
                                'price',
                                isLessThanOrEqualTo:
                                    FFAppState().filterPriceHigher.toDouble(),
                              )
                              .where(
                                'price',
                                isGreaterThanOrEqualTo:
                                    FFAppState().filterPriceLower.toDouble(),
                              )
                              .whereArrayContainsAny(
                                  'colors',
                                  FFAppState()
                                      .filterColorIds
                                      .map((e) => e.id)
                                      .toList()),
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
                          int textCount = snapshot.data!;
                          return Text(
                            '${textCount.toString()} items',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          );
                        },
                      );
                    } else {
                      return FutureBuilder<int>(
                        future: queryProductsRecordCount(
                          queryBuilder: (productsRecord) => productsRecord
                              .where(
                                'type',
                                isEqualTo: FFAppState().firterProductTypeId,
                              )
                              .where(
                                'price',
                                isLessThanOrEqualTo:
                                    FFAppState().filterPriceHigher.toDouble(),
                              )
                              .where(
                                'price',
                                isGreaterThanOrEqualTo:
                                    FFAppState().filterPriceLower.toDouble(),
                              )
                              .whereArrayContainsAny(
                                  'colors',
                                  FFAppState()
                                      .filterColorIds
                                      .map((e) => e.id)
                                      .toList()),
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
                          int textCount = snapshot.data!;
                          return Text(
                            '${textCount.toString()} items',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        Builder(
          builder: (context) {
            if (valueOrDefault<bool>(
              _model.sortBy == 'Price: lowest to high',
              false,
            )) {
              return Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 53.0),
                  child:
                      PagedGridView<DocumentSnapshot<Object?>?, ProductsRecord>(
                    pagingController: _model.setGridViewController1(
                      ProductsRecord.collection
                          .where(
                            'price',
                            isLessThanOrEqualTo:
                                FFAppState().filterPriceHigher.toDouble(),
                          )
                          .where(
                            'price',
                            isGreaterThanOrEqualTo:
                                FFAppState().filterPriceLower.toDouble(),
                          )
                          .where(
                            'type',
                            isEqualTo: FFAppState().firterProductTypeId ==
                                    '3IsjNApvCaUKWQyC0fl0'
                                ? null
                                : FFAppState().firterProductTypeId,
                          )
                          .whereArrayContainsAny(
                              'colors',
                              FFAppState()
                                  .filterColorIds
                                  .map((e) => e.id)
                                  .toList())
                          .orderBy('price'),
                    ),
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 17.0,
                      mainAxisSpacing: 24.0,
                      childAspectRatio: 0.6,
                    ),
                    primary: false,
                    shrinkWrap: true,
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
                            .gridViewPagingController1!
                            .itemList![gridViewIndex];
                        return ProductWidget(
                          key: Key(
                              'Keyd3x_${gridViewIndex}_of_${_model.gridViewPagingController1!.itemList!.length}'),
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
              );
            } else {
              return Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 53.0),
                  child:
                      PagedGridView<DocumentSnapshot<Object?>?, ProductsRecord>(
                    pagingController: _model.setGridViewController2(
                      ProductsRecord.collection
                          .where(
                            'price',
                            isLessThanOrEqualTo:
                                FFAppState().filterPriceHigher.toDouble(),
                          )
                          .where(
                            'price',
                            isGreaterThanOrEqualTo:
                                FFAppState().filterPriceLower.toDouble(),
                          )
                          .where(
                            'type',
                            isEqualTo: FFAppState().firterProductTypeId ==
                                    '3IsjNApvCaUKWQyC0fl0'
                                ? null
                                : FFAppState().firterProductTypeId,
                          )
                          .whereArrayContainsAny(
                              'colors',
                              FFAppState()
                                  .filterColorIds
                                  .map((e) => e.id)
                                  .toList())
                          .orderBy('price', descending: true),
                    ),
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 17.0,
                      mainAxisSpacing: 24.0,
                      childAspectRatio: 0.6,
                    ),
                    primary: false,
                    shrinkWrap: true,
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
                            .gridViewPagingController2!
                            .itemList![gridViewIndex];
                        return ProductWidget(
                          key: Key(
                              'Key7az_${gridViewIndex}_of_${_model.gridViewPagingController2!.itemList!.length}'),
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
              );
            }
          },
        ),
      ],
    );
  }
}
