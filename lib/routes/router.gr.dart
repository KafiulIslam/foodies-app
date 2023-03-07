// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:auto_route/empty_router_widgets.dart' as _i4;
import 'package:flutter/foundation.dart' as _i11;
import 'package:flutter/material.dart' as _i10;
import 'package:foodies/main.dart' as _i1;
import 'package:foodies/view/dashboard.dart' as _i3;
import 'package:foodies/view/favourite_page.dart' as _i5;
import 'package:foodies/view/food_details.dart' as _i8;
import 'package:foodies/view/home_page.dart' as _i7;
import 'package:foodies/view/onBoard/login_page.dart' as _i2;
import 'package:foodies/view/profile.dart' as _i6;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    OnBoardRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.OnBoard(),
      );
    },
    LogInPageRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LogInPage(),
      );
    },
    DashBoardRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashBoard(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    FavouriteRouter.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.Favourite(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.Profile(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.Home(),
      );
    },
    SingleFood.name: (routeData) {
      final args = routeData.argsAs<SingleFoodArgs>();
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i8.FoodDetails(
          key: args.key,
          image: args.image,
          itemName: args.itemName,
          price: args.price,
        ),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/onBoard',
          fullMatch: true,
        ),
        _i9.RouteConfig(
          OnBoardRoute.name,
          path: '/onBoard',
          children: [
            _i9.RouteConfig(
              '*#redirect',
              path: '*',
              parent: OnBoardRoute.name,
              redirectTo: '',
              fullMatch: true,
            )
          ],
        ),
        _i9.RouteConfig(
          LogInPageRoute.name,
          path: '/login',
          children: [
            _i9.RouteConfig(
              '*#redirect',
              path: '*',
              parent: LogInPageRoute.name,
              redirectTo: '',
              fullMatch: true,
            )
          ],
        ),
        _i9.RouteConfig(
          DashBoardRoute.name,
          path: '/dashboard',
          children: [
            _i9.RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: DashBoardRoute.name,
              children: [
                _i9.RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: HomeRouter.name,
                ),
                _i9.RouteConfig(
                  SingleFood.name,
                  path: ':itemName',
                  parent: HomeRouter.name,
                ),
              ],
            ),
            _i9.RouteConfig(
              FavouriteRouter.name,
              path: 'favourite',
              parent: DashBoardRoute.name,
            ),
            _i9.RouteConfig(
              ProfileRouter.name,
              path: 'profile',
              parent: DashBoardRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.OnBoard]
class OnBoardRoute extends _i9.PageRouteInfo<void> {
  const OnBoardRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OnBoardRoute.name,
          path: '/onBoard',
          initialChildren: children,
        );

  static const String name = 'OnBoardRoute';
}

/// generated route for
/// [_i2.LogInPage]
class LogInPageRoute extends _i9.PageRouteInfo<void> {
  const LogInPageRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LogInPageRoute.name,
          path: '/login',
          initialChildren: children,
        );

  static const String name = 'LogInPageRoute';
}

/// generated route for
/// [_i3.DashBoard]
class DashBoardRoute extends _i9.PageRouteInfo<void> {
  const DashBoardRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class HomeRouter extends _i9.PageRouteInfo<void> {
  const HomeRouter({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i5.Favourite]
class FavouriteRouter extends _i9.PageRouteInfo<void> {
  const FavouriteRouter()
      : super(
          FavouriteRouter.name,
          path: 'favourite',
        );

  static const String name = 'FavouriteRouter';
}

/// generated route for
/// [_i6.Profile]
class ProfileRouter extends _i9.PageRouteInfo<void> {
  const ProfileRouter()
      : super(
          ProfileRouter.name,
          path: 'profile',
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i7.Home]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.FoodDetails]
class SingleFood extends _i9.PageRouteInfo<SingleFoodArgs> {
  SingleFood({
    _i11.Key? key,
    required String image,
    required String itemName,
    required String price,
  }) : super(
          SingleFood.name,
          path: ':itemName',
          args: SingleFoodArgs(
            key: key,
            image: image,
            itemName: itemName,
            price: price,
          ),
          rawPathParams: {'itemName': itemName},
        );

  static const String name = 'SingleFood';
}

class SingleFoodArgs {
  const SingleFoodArgs({
    this.key,
    required this.image,
    required this.itemName,
    required this.price,
  });

  final _i11.Key? key;

  final String image;

  final String itemName;

  final String price;

  @override
  String toString() {
    return 'SingleFoodArgs{key: $key, image: $image, itemName: $itemName, price: $price}';
  }
}
