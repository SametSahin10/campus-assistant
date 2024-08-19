import 'package:auto_route/auto_route.dart';
import 'package:campus_assistant/navigation/routes.dart';

export 'routes.gr.dart';

@AutoRouterConfig()
class RootRouter extends $RootRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: StartIndoorNavigationRoute.page),
    AutoRoute(page: IndoorNavigationRoute.page),
    AutoRoute(page: OutdoorNavigationRoute.page),
    AutoRoute(page: QrCodeScannerRoute.page),
    AutoRoute(page: ViewImageWithBoundingBoxesRoute.page),
  ];
}
