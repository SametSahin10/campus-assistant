// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i11;

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:campus_assistant/features/indoor_navigation/models/shortest_path.dart'
    as _i10;
import 'package:campus_assistant/features/outdoor_navigation/models/bounding_box.dart'
    as _i12;
import 'package:campus_assistant/home_screen.dart' as _i1;
import 'package:campus_assistant/screens/indoor_navigation/indoor_navigation_screen.dart'
    as _i2;
import 'package:campus_assistant/screens/indoor_navigation/start_indoor_navigation_screen.dart'
    as _i5;
import 'package:campus_assistant/screens/outdoor_navigation/outdoor_navigation_screen.dart'
    as _i3;
import 'package:campus_assistant/screens/outdoor_navigation/view_image_with_bounding_boxes_screen.dart'
    as _i6;
import 'package:campus_assistant/screens/qr_code_scanner_screen.dart' as _i4;
import 'package:flutter/material.dart' as _i9;
import 'package:mobile_scanner/mobile_scanner.dart' as _i8;

abstract class $RootRouter extends _i7.RootStackRouter {
  $RootRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    IndoorNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<IndoorNavigationRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.IndoorNavigationScreen(
          key: args.key,
          shortestPath: args.shortestPath,
        ),
      );
    },
    OutdoorNavigationRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.OutdoorNavigationScreen(),
      );
    },
    QrCodeScannerRoute.name: (routeData) {
      return _i7.AutoRoutePage<_i8.BarcodeCapture>(
        routeData: routeData,
        child: const _i4.QrCodeScannerScreen(),
      );
    },
    StartIndoorNavigationRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.StartIndoorNavigationScreen(),
      );
    },
    ViewImageWithBoundingBoxesRoute.name: (routeData) {
      final args = routeData.argsAs<ViewImageWithBoundingBoxesRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ViewImageWithBoundingBoxesScreen(
          key: args.key,
          image: args.image,
          boundingBoxes: args.boundingBoxes,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.IndoorNavigationScreen]
class IndoorNavigationRoute
    extends _i7.PageRouteInfo<IndoorNavigationRouteArgs> {
  IndoorNavigationRoute({
    _i9.Key? key,
    required _i10.ShortestPath shortestPath,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          IndoorNavigationRoute.name,
          args: IndoorNavigationRouteArgs(
            key: key,
            shortestPath: shortestPath,
          ),
          initialChildren: children,
        );

  static const String name = 'IndoorNavigationRoute';

  static const _i7.PageInfo<IndoorNavigationRouteArgs> page =
      _i7.PageInfo<IndoorNavigationRouteArgs>(name);
}

class IndoorNavigationRouteArgs {
  const IndoorNavigationRouteArgs({
    this.key,
    required this.shortestPath,
  });

  final _i9.Key? key;

  final _i10.ShortestPath shortestPath;

  @override
  String toString() {
    return 'IndoorNavigationRouteArgs{key: $key, shortestPath: $shortestPath}';
  }
}

/// generated route for
/// [_i3.OutdoorNavigationScreen]
class OutdoorNavigationRoute extends _i7.PageRouteInfo<void> {
  const OutdoorNavigationRoute({List<_i7.PageRouteInfo>? children})
      : super(
          OutdoorNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'OutdoorNavigationRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.QrCodeScannerScreen]
class QrCodeScannerRoute extends _i7.PageRouteInfo<void> {
  const QrCodeScannerRoute({List<_i7.PageRouteInfo>? children})
      : super(
          QrCodeScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrCodeScannerRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.StartIndoorNavigationScreen]
class StartIndoorNavigationRoute extends _i7.PageRouteInfo<void> {
  const StartIndoorNavigationRoute({List<_i7.PageRouteInfo>? children})
      : super(
          StartIndoorNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartIndoorNavigationRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ViewImageWithBoundingBoxesScreen]
class ViewImageWithBoundingBoxesRoute
    extends _i7.PageRouteInfo<ViewImageWithBoundingBoxesRouteArgs> {
  ViewImageWithBoundingBoxesRoute({
    _i9.Key? key,
    required _i11.Image image,
    required List<_i12.BoundingBox> boundingBoxes,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ViewImageWithBoundingBoxesRoute.name,
          args: ViewImageWithBoundingBoxesRouteArgs(
            key: key,
            image: image,
            boundingBoxes: boundingBoxes,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewImageWithBoundingBoxesRoute';

  static const _i7.PageInfo<ViewImageWithBoundingBoxesRouteArgs> page =
      _i7.PageInfo<ViewImageWithBoundingBoxesRouteArgs>(name);
}

class ViewImageWithBoundingBoxesRouteArgs {
  const ViewImageWithBoundingBoxesRouteArgs({
    this.key,
    required this.image,
    required this.boundingBoxes,
  });

  final _i9.Key? key;

  final _i11.Image image;

  final List<_i12.BoundingBox> boundingBoxes;

  @override
  String toString() {
    return 'ViewImageWithBoundingBoxesRouteArgs{key: $key, image: $image, boundingBoxes: $boundingBoxes}';
  }
}
