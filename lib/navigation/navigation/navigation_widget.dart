import '/catalogue/catalogue/catalogue_widget.dart';
import '/catalogue/catalogue_app_bar/catalogue_app_bar_widget.dart';
import '/favorite/favorite/favorite_widget.dart';
import '/favorite/favorite_app_bar/favorite_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/home/home_widget.dart';
import '/home/home_app_bar/home_app_bar_widget.dart';
import '/navigation/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import '/profile/profile/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navigation_model.dart';
export 'navigation_model.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({Key? key}) : super(key: key);

  @override
  _NavigationWidgetState createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  late NavigationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationModel());
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  children: [
                    Builder(
                      builder: (context) {
                        if (FFAppState().pageNumber == 1) {
                          return wrapWithModel(
                            model: _model.homeModel,
                            updateCallback: () => setState(() {}),
                            child: HomeWidget(),
                          );
                        } else if (FFAppState().pageNumber == 2) {
                          return wrapWithModel(
                            model: _model.catalogueModel,
                            updateCallback: () => setState(() {}),
                            child: CatalogueWidget(),
                          );
                        } else if (FFAppState().pageNumber == 3) {
                          return wrapWithModel(
                            model: _model.favoriteModel,
                            updateCallback: () => setState(() {}),
                            child: FavoriteWidget(),
                          );
                        } else {
                          return wrapWithModel(
                            model: _model.profileModel,
                            updateCallback: () => setState(() {}),
                            child: ProfileWidget(),
                          );
                        }
                      },
                    ),
                    wrapWithModel(
                      model: _model.bottomNavigationBarModel,
                      updateCallback: () => setState(() {}),
                      child: BottomNavigationBarWidget(),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Builder(
                        builder: (context) {
                          if (FFAppState().pageNumber == 1) {
                            return wrapWithModel(
                              model: _model.homeAppBarModel,
                              updateCallback: () => setState(() {}),
                              child: HomeAppBarWidget(),
                            );
                          } else if (FFAppState().pageNumber == 2) {
                            return wrapWithModel(
                              model: _model.catalogueAppBarModel,
                              updateCallback: () => setState(() {}),
                              child: CatalogueAppBarWidget(),
                            );
                          } else if (FFAppState().pageNumber == 3) {
                            return wrapWithModel(
                              model: _model.favoriteAppBarModel,
                              updateCallback: () => setState(() {}),
                              child: FavoriteAppBarWidget(),
                            );
                          } else {
                            return Container(
                              width: 0.0,
                              height: 0.0,
                              decoration: BoxDecoration(),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
