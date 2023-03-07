import 'package:auto_route/annotations.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:foodies/main.dart';
import 'package:foodies/view/favourite_page.dart';
import 'package:foodies/view/food_details.dart';
import 'package:foodies/view/onBoard/login_page.dart';
import 'package:foodies/view/profile.dart';

import '../view/dashboard.dart';
import '../view/home_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    //authentification routes
    AutoRoute(
      initial: true,
      path: '/onBoard',
      page: OnBoard,
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      path: '/login',
      page: LogInPage,
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),

    AutoRoute(
        path: '/dashboard',
        page: DashBoard,
        children: [
          AutoRoute(
              path: 'home',
              name: 'HomeRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(path: '',page: Home,),
                AutoRoute(path: ':itemName', name: 'SingleFood', page: FoodDetails),
              ]
          ),
          AutoRoute(
            path: 'favourite',
            name: 'FavouriteRouter',
            page: Favourite,
          ),
          AutoRoute(
            path: 'profile',
            name: 'ProfileRouter',
            page: Profile,
          ),
        ])
  ],
)

class $AppRouter {}
