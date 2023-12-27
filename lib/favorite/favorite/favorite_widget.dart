import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/product_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favorite_model.dart';
export 'favorite_model.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  late FavoriteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 68.0, 16.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FutureBuilder<int>(
                  future: queryProductsRecordCount(
                    queryBuilder: (productsRecord) => productsRecord.where(
                      'in_favorites',
                      arrayContains: currentUserUid,
                    ),
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
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                    child: Text(
                      'Sort by:',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'SF Pro Text',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(
                      _model.dropDownValue ??= 'ASC',
                    ),
                    options: List<String>.from(['ASC', 'DESC']),
                    optionLabels: ['lowest to hight', 'highest to low'],
                    onChanged: (val) =>
                        setState(() => _model.dropDownValue = val),
                    width: 120.0,
                    height: 40.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Text',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    elevation: 0.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 8.0,
                    margin: EdgeInsets.all(0.0),
                    hidesUnderline: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ],
              ),
            ],
          ),
          Builder(
            builder: (context) {
              if (_model.dropDownValue == 'ASC') {
                return Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 53.0),
                  child: StreamBuilder<List<ProductsRecord>>(
                    stream: queryProductsRecord(
                      queryBuilder: (productsRecord) => productsRecord
                          .where(
                            'in_favorites',
                            arrayContains: currentUserUid,
                          )
                          .orderBy('price'),
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
                      List<ProductsRecord> gridViewProductsRecordList =
                          snapshot.data!;
                      return GridView.builder(
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
                        itemCount: gridViewProductsRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewProductsRecord =
                              gridViewProductsRecordList[gridViewIndex];
                          return ProductWidget(
                            key: Key(
                                'Keyxc8_${gridViewIndex}_of_${gridViewProductsRecordList.length}'),
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
                      );
                    },
                  ),
                );
              } else {
                return Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 53.0),
                  child: StreamBuilder<List<ProductsRecord>>(
                    stream: queryProductsRecord(
                      queryBuilder: (productsRecord) => productsRecord
                          .where(
                            'in_favorites',
                            arrayContains: currentUserUid,
                          )
                          .orderBy('price', descending: true),
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
                      List<ProductsRecord> gridViewProductsRecordList =
                          snapshot.data!;
                      return GridView.builder(
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
                        itemCount: gridViewProductsRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewProductsRecord =
                              gridViewProductsRecordList[gridViewIndex];
                          return ProductWidget(
                            key: Key(
                                'Keyy8e_${gridViewIndex}_of_${gridViewProductsRecordList.length}'),
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
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
