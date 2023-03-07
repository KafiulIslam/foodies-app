import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodies/routes/router.gr.dart';
import 'package:foodies/view/favourite_page.dart';
import 'package:foodies/view/profile.dart';
import '../utils/constantpage.dart';
import 'home_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: AutoTabsScaffold(
        routes: const [HomeRouter(), FavouriteRouter(), ProfileRouter()],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            backgroundColor: lightAss,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: brandColor,
            unselectedItemColor: fadeBrandColor,
            iconSize: 30,
            elevation: 0.0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  tooltip: 'Home',
                  icon: Icon(Icons.home_outlined),
                  label: ' ',
                ),
                BottomNavigationBarItem(
                  tooltip: 'Favourite',
                  icon: Icon(Icons.favorite),
                  label: ' ',
                ),
                BottomNavigationBarItem(
                  tooltip: 'Profile',
                  icon: Icon(Icons.person_outline),
                  label: ' ',
                ),
              ],
             );
        },
      ),
    );
  }
}