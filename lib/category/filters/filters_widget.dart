import '/backend/backend.dart';
import '/category/filter_app_bar/filter_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filters_model.dart';
export 'filters_model.dart';

class FiltersWidget extends StatefulWidget {
  const FiltersWidget({Key? key}) : super(key: key);

  @override
  _FiltersWidgetState createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  late FiltersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltersModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              wrapWithModel(
                model: _model.filterAppBarModel,
                updateCallback: () => setState(() {}),
                child: FilterAppBarWidget(),
              ),
              Flexible(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Text(
                              'Price',
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        Container(
                          width: 395.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Container(
                            width: 100.0,
                            height: 24.0,
                            child: custom_widgets.RangeSliderWidget(
                              width: 100.0,
                              height: 24.0,
                              start: 0.0,
                              end: 800.0,
                              activeColor: FlutterFlowTheme.of(context).accent1,
                              inactiveColor:
                                  FlutterFlowTheme.of(context).alternate,
                              trackheight: 4.0,
                              onChanged: () async {
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).info,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '\$${valueOrDefault<String>(
                                  FFAppState().filterPriceLower.toString(),
                                  '0',
                                )}',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              SizedBox(
                                height: 100.0,
                                child: VerticalDivider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              Text(
                                '\$${valueOrDefault<String>(
                                  FFAppState().filterPriceHigher.toString(),
                                  '100',
                                )}',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 8.0),
                            child: Text(
                              'Categories',
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        StreamBuilder<List<ProductTypeRecord>>(
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
                            List<ProductTypeRecord>
                                categoriesDownProductTypeRecordList =
                                snapshot.data!;
                            return FlutterFlowDropDown<String>(
                              controller:
                                  _model.categoriesDownValueController ??=
                                      FormFieldController<String>(null),
                              options: categoriesDownProductTypeRecordList
                                  .map((e) => e.name)
                                  .toList(),
                              onChanged: (val) => setState(
                                  () => _model.categoriesDownValue = val),
                              width: double.infinity,
                              height: 50.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Please select category...',
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            );
                          },
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 8.0),
                            child: Text(
                              'Brand',
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        StreamBuilder<List<BrandsRecord>>(
                          stream: queryBrandsRecord(),
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
                            List<BrandsRecord> brandsDownBrandsRecordList =
                                snapshot.data!;
                            return FlutterFlowDropDown<String>(
                              controller: _model.brandsDownValueController ??=
                                  FormFieldController<String>(null),
                              options: brandsDownBrandsRecordList
                                  .map((e) => e.name)
                                  .toList(),
                              onChanged: null,
                              width: double.infinity,
                              height: 50.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Please select brand...',
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: true,
                              onChangedForMultiSelect: (val) async {
                                setState(() => _model.brandsDownValue = val);
                                setState(() {
                                  FFAppState().filterBrands = _model
                                      .brandsDownValue!
                                      .toList()
                                      .cast<String>();
                                });
                              },
                            );
                          },
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 8.0),
                            child: Text(
                              'Colors',
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: StreamBuilder<List<ColorsRecord>>(
                            stream: queryColorsRecord(),
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
                              List<ColorsRecord> listViewColorsRecordList =
                                  snapshot.data!;
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: listViewColorsRecordList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(width: 16.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewColorsRecord =
                                      listViewColorsRecordList[listViewIndex];
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        if (FFAppState().filterColors.contains(
                                            listViewColorsRecord.color)) {
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                FFAppState()
                                                    .removeFromFilterColors(
                                                        listViewColorsRecord
                                                            .color!);
                                                FFAppState()
                                                    .removeFromFilterColorIds(
                                                        listViewColorsRecord
                                                            .reference);
                                              });
                                            },
                                            child: Container(
                                              width: 47.0,
                                              height: 47.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          listViewColorsRecord
                                                              .color,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  FFAppState()
                                                      .addToFilterColors(
                                                          listViewColorsRecord
                                                              .color!);
                                                  FFAppState()
                                                      .addToFilterColorIds(
                                                          listViewColorsRecord
                                                              .reference);
                                                });
                                              },
                                              child: Container(
                                                width: 47.0,
                                                height: 47.0,
                                                decoration: BoxDecoration(
                                                  color: listViewColorsRecord
                                                      .color,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Colors.transparent,
                                                    width: 3.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 8.0),
                            child: Text(
                              'Sort by',
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        StreamBuilder<List<ProductTypeRecord>>(
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
                            List<ProductTypeRecord>
                                sortByDownProductTypeRecordList =
                                snapshot.data!;
                            return FlutterFlowDropDown<String>(
                              controller: _model.sortByDownValueController ??=
                                  FormFieldController<String>(null),
                              options: sortByDownProductTypeRecordList
                                  .map((e) => e.name)
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => _model.sortByDownValue = val),
                              width: double.infinity,
                              height: 50.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Please select sorting...',
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 20.0),
                          child: FutureBuilder<int>(
                            future: queryProductsRecordCount(
                              queryBuilder: (productsRecord) => productsRecord
                                  .where(
                                    'price',
                                    isGreaterThanOrEqualTo: FFAppState()
                                        .filterPriceLower
                                        .toDouble(),
                                  )
                                  .where(
                                    'price',
                                    isLessThanOrEqualTo: FFAppState()
                                        .filterPriceHigher
                                        .toDouble(),
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
                              int buttonCount = snapshot.data!;
                              return FFButtonWidget(
                                onPressed: () async {
                                  context.safePop();
                                },
                                text: 'Results (${buttonCount.toString()})',
                                options: FFButtonOptions(
                                  height: 48.0,
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
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
