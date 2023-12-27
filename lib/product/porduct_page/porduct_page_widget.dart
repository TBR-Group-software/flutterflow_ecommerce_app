import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/product_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/product/product_bottom_bar/product_bottom_bar_widget.dart';
import '/product/review/review_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'porduct_page_model.dart';
export 'porduct_page_model.dart';

class PorductPageWidget extends StatefulWidget {
  const PorductPageWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductsRecord? product;

  @override
  _PorductPageWidgetState createState() => _PorductPageWidgetState();
}

class _PorductPageWidgetState extends State<PorductPageWidget> {
  late PorductPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PorductPageModel());
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
        backgroundColor: Color(0xFFF4F3F4),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 356.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      children: [
                        Builder(
                          builder: (context) {
                            final images =
                                widget.product?.imagesUrl?.toList() ?? [];
                            return Container(
                              width: double.infinity,
                              height: 500.0,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage:
                                                min(0, images.length - 1)),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: images.length,
                                    itemBuilder: (context, imagesIndex) {
                                      final imagesItem = images[imagesIndex];
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          imagesItem,
                                          width: double.infinity,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage:
                                                    min(0, images.length - 1)),
                                        count: images.length,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) async {
                                          await _model.pageViewController!
                                              .animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        effect:
                                            smooth_page_indicator.SlideEffect(
                                          spacing: 8.0,
                                          radius: 16.0,
                                          dotWidth: 8.0,
                                          dotHeight: 8.0,
                                          dotColor: Color(0x91FFFFFF),
                                          activeDotColor: Color(0xE0FFFFFF),
                                          paintStyle: PaintingStyle.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Container(
                          width: double.infinity,
                          height: 45.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xCE000000), Colors.transparent],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 30.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RatingBar.builder(
                                      onRatingUpdate: (newValue) => setState(
                                          () =>
                                              _model.ratingBarValue = newValue),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                      ),
                                      direction: Axis.horizontal,
                                      initialRating: _model.ratingBarValue ??=
                                          widget.product!.raiting.toDouble(),
                                      unratedColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      itemCount: 5,
                                      itemSize: 12.0,
                                      glowColor:
                                          FlutterFlowTheme.of(context).accent2,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '${widget.product?.raiting?.toString()} reviews',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (valueOrDefault<bool>(
                                            widget.product?.inStock,
                                            false,
                                          )) {
                                            return Text(
                                              'In Stock',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.0,
                                                height: 16.0,
                                              ),
                                            );
                                          } else {
                                            return Text(
                                              'Out of Stock',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.0,
                                                height: 16.0,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 14.0, 0.0, 0.0),
                                child: Text(
                                  widget.product!.title,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  '\$${widget.product?.price?.toString()}',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'Colors',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final colorImages =
                                        widget.product?.colorImages?.toList() ??
                                            [];
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: colorImages.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(width: 12.0),
                                      itemBuilder: (context, colorImagesIndex) {
                                        final colorImagesItem =
                                            colorImages[colorImagesIndex];
                                        return Builder(
                                          builder: (context) {
                                            if (!false) {
                                              return Container(
                                                width: 47.0,
                                                height: 47.0,
                                                constraints: BoxConstraints(
                                                  minWidth: 47.0,
                                                  minHeight: 47.0,
                                                  maxWidth: 47.0,
                                                  maxHeight: 47.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: Image.network(
                                                      colorImagesItem,
                                                    ).image,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                width: 100.0,
                                                height: 100.0,
                                                constraints: BoxConstraints(
                                                  minWidth: 47.0,
                                                  minHeight: 47.0,
                                                  maxWidth: 47.0,
                                                  maxHeight: 47.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: Image.network(
                                                      colorImagesItem,
                                                    ).image,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
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
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'Sizes',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 24.0),
                              child: Container(
                                width: double.infinity,
                                height: 200.0,
                                constraints: BoxConstraints(
                                  maxHeight: 47.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Visibility(
                                  visible: false,
                                  child: StreamBuilder<List<SizesRecord>>(
                                    stream: querySizesRecord(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<SizesRecord>
                                          listViewSizesRecordList =
                                          snapshot.data!;
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            listViewSizesRecordList.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(width: 12.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewSizesRecord =
                                              listViewSizesRecordList[
                                                  listViewIndex];
                                          return Builder(
                                            builder: (context) {
                                              if (FFAppState()
                                                  .filterSizes
                                                  .contains(listViewSizesRecord
                                                      .size)) {
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      FFAppState()
                                                          .removeFromFilterSizes(
                                                              listViewSizesRecord
                                                                  .size);
                                                      FFAppState()
                                                          .removeFromFilterSizesIds(
                                                              listViewSizesRecord
                                                                  .reference);
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 47.0,
                                                    height: 47.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        listViewSizesRecord
                                                            .size,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      FFAppState()
                                                          .addToFilterSizes(
                                                              listViewSizesRecord
                                                                  .size);
                                                      FFAppState()
                                                          .addToFilterSizesIds(
                                                              listViewSizesRecord
                                                                  .reference);
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 47.0,
                                                    height: 47.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        listViewSizesRecord
                                                            .size,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Text(
                                'Product details',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                widget.product!.title,
                                maxLines: 4,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: Color(0x00E7B944),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 280.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: StreamBuilder<List<ReviewsRecord>>(
                        stream: queryReviewsRecord(
                          singleRecord: true,
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
                          List<ReviewsRecord> reviewReviewsRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final reviewReviewsRecord =
                              reviewReviewsRecordList.isNotEmpty
                                  ? reviewReviewsRecordList.first
                                  : null;
                          return wrapWithModel(
                            model: _model.reviewModel,
                            updateCallback: () => setState(() {}),
                            child: ReviewWidget(
                              review: reviewReviewsRecord!,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
                      child: Text(
                        'Products related to this item',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Container(
                      height: 400.0,
                      decoration: BoxDecoration(),
                      child: StreamBuilder<List<ProductsRecord>>(
                        stream: queryProductsRecord(),
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
                          List<ProductsRecord> listViewProductsRecordList =
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
                            itemCount: listViewProductsRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(width: 16.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewProductsRecord =
                                  listViewProductsRecordList[listViewIndex];
                              return Container(
                                width: 140.0,
                                decoration: BoxDecoration(),
                                child: ProductWidget(
                                  key: Key(
                                      'Keyruv_${listViewIndex}_of_${listViewProductsRecordList.length}'),
                                  discount: listViewProductsRecord.discount,
                                  image: listViewProductsRecord.imagesUrl.first,
                                  raiting: listViewProductsRecord.raiting,
                                  title: listViewProductsRecord.title,
                                  price: listViewProductsRecord.price,
                                  discountPrice:
                                      listViewProductsRecord.discountPrice,
                                  isFavorite: false,
                                  docRef: listViewProductsRecord.reference,
                                  doc: listViewProductsRecord,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: StreamBuilder<List<CartRecord>>(
                stream: queryCartRecord(
                  queryBuilder: (cartRecord) => cartRecord.where(
                    'user_id',
                    isEqualTo: currentUserUid,
                  ),
                  singleRecord: true,
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
                  List<CartRecord> productBottomBarCartRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final productBottomBarCartRecord =
                      productBottomBarCartRecordList.isNotEmpty
                          ? productBottomBarCartRecordList.first
                          : null;
                  return wrapWithModel(
                    model: _model.productBottomBarModel,
                    updateCallback: () => setState(() {}),
                    child: ProductBottomBarWidget(
                      product: widget.product!,
                      cart: productBottomBarCartRecord!.reference,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
