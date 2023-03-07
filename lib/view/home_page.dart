import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodies/widgets/common_classes.dart';
import 'package:foodies/utils/constantpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int selectMenuList = 0;
  int selectMenuCard = 0;

  late AnimationController _animationControllerInHome;
  late Animation<double> _animationMiniRoundButtonScaleUp;
  late Animation<double> _animationOpacity;
  late Animation<Offset> _animationListViewRightSlide;
  late Animation<Offset> _animationListViewLeftSlide;
  late Animation<double> _animationButtonIn;
  late Animation<double> _animationNavigationBarOpacity;

  void _animationExecutionInHome() {
    _animationControllerInHome =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationMiniRoundButtonScaleUp = Tween(begin: 0.20, end: 1.00).animate(
        CurvedAnimation(
            parent: _animationControllerInHome,
            curve: const Interval(0.0, 0.20, curve: Curves.easeIn)));

    _animationOpacity = CurvedAnimation(
        parent: _animationControllerInHome,
        curve:
            const Interval(0.10, 0.30, curve: Curves.fastLinearToSlowEaseIn));

    _animationListViewRightSlide = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationControllerInHome,
      curve: const Interval(0.30, 0.60, curve: Curves.fastLinearToSlowEaseIn),
    ));

    _animationListViewLeftSlide = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationControllerInHome,
      curve: const Interval(0.30, 0.60, curve: Curves.fastLinearToSlowEaseIn),
    ));

    _animationButtonIn = CurvedAnimation(
        parent: _animationControllerInHome,
        curve:
            const Interval(0.60, 0.80, curve: Curves.fastLinearToSlowEaseIn));

    _animationNavigationBarOpacity = CurvedAnimation(
        parent: _animationControllerInHome,
        curve: const Interval(0.70, 1.0, curve: Curves.easeInSine));

    _animationControllerInHome.forward();
  }

  @override
  void initState() {
    _animationExecutionInHome();
    super.initState();
  }

  @override
  void dispose() {
    _animationControllerInHome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> menuList = [
      TextWithBar(
          item: 'BreakFast',
          textColor: selectMenuList == 0 ? black : deepAss,
          barColor: selectMenuList == 0 ? brandColor : transparent),
      TextWithBar(
          item: 'Lunch',
          textColor: selectMenuList == 1 ? black : deepAss,
          barColor: selectMenuList == 1 ? brandColor : transparent),
      TextWithBar(
          item: 'Snacks',
          textColor: selectMenuList == 2 ? black : deepAss,
          barColor: selectMenuList == 2 ? brandColor : transparent),
      TextWithBar(
          item: 'Dinner',
          textColor: selectMenuList == 3 ? black : deepAss,
          barColor: selectMenuList == 3 ? brandColor : transparent),
      TextWithBar(
          item: 'Juice',
          textColor: selectMenuList == 4 ? black : deepAss,
          barColor: selectMenuList == 4 ? brandColor : transparent),
      TextWithBar(
          item: 'Desert',
          textColor: selectMenuList == 5 ? black : deepAss,
          barColor: selectMenuList == 5 ? brandColor : transparent),
      TextWithBar(
          item: 'Pastry',
          textColor: selectMenuList == 6 ? black : deepAss,
          barColor: selectMenuList == 6 ? brandColor : transparent),
      TextWithBar(
          item: 'Juice',
          textColor: selectMenuList == 7 ? black : deepAss,
          barColor: selectMenuList == 7 ? brandColor : transparent),
      TextWithBar(
          item: 'Desert',
          textColor: selectMenuList == 8 ? black : deepAss,
          barColor: selectMenuList == 8 ? brandColor : transparent),
      TextWithBar(
          item: 'Thai',
          textColor: selectMenuList == 9 ? black : deepAss,
          barColor: selectMenuList == 9 ? brandColor : transparent),
      TextWithBar(
          item: 'Soup',
          textColor: selectMenuList == 10 ? black : deepAss,
          barColor: selectMenuList == 10 ? brandColor : transparent),
      TextWithBar(
          item: 'Chinese',
          textColor: selectMenuList == 11 ? black : deepAss,
          barColor: selectMenuList == 11 ? brandColor : transparent),
    ];

    List<Widget> menuCardsList = [
      const MenuCard(
          image: 'images/pizza.png',
          itemName: "Beef\nPizza",
          price: '1200 tk.'),
      const MenuCard(
          image: 'images/burger.png',
          itemName: "Chicken\nBurger",
          price: '1800 tk.'),
      const MenuCard(
          image: 'images/vagetable pasta.png',
          itemName: "Vegetable\nPasta",
          price: '420 tk.'),
      const MenuCard(
          image: 'images/noodles.png',
          itemName: "Egg\nNoodles",
          price: '160 tk.'),
      const MenuCard(
          image: 'images/seafood.png',
          itemName: "Sea\nFood",
          price: '1500 tk.'),
      const MenuCard(
          image: 'images/chicken nuggets.png',
          itemName: "Chicken\nNuggets",
          price: '450 tk.'),
    ];

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: AnimatedBuilder(
          animation: _animationControllerInHome,
          builder: (context, _) {
            return Scaffold(
              backgroundColor: lightAss,
              body: Padding(
                padding: EdgeInsets.only(
                  top: height / 18,
                  bottom: height / 56,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 13, right: width / 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform.scale(
                                scale: _animationMiniRoundButtonScaleUp.value,
                                child: const ShortCircleButton(
                                  icon: Icons.menu,
                                  iconColor: white,
                                  circleColor: brandColor,
                                )),
                            Transform.scale(
                                scale: _animationMiniRoundButtonScaleUp.value,
                                child: const ShortCircleButton(
                                    icon: Icons.shopping_cart,
                                    iconColor: white,
                                    circleColor: brandColor)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height / 28,
                      ),
                      Opacity(
                        opacity: _animationOpacity.value,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width / 13, right: width / 13),
                          child: CupertinoSearchTextField(
                            backgroundColor: white,
                            borderRadius: BorderRadius.circular(16.r),
                            prefixInsets: EdgeInsets.only(left: 24.w),
                            suffixInsets: EdgeInsets.only(left: 24.w),
                            onChanged: (value) {},
                            onTap: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 28,
                      ),
                      Container(
                          height: height / 25,
                          width: double.infinity,
                          child: SlideTransition(
                            position: _animationListViewRightSlide,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width / 13, right: width / 13),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // padding: const EdgeInsets.all(8),
                                  itemCount: menuList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectMenuList = index;
                                          });
                                        },
                                        child: menuList[index]);
                                  }),
                            ),
                          )),
                      SizedBox(
                        height: height / 28,
                      ),
                      SlideTransition(
                        position: _animationListViewLeftSlide,
                        child: Container(
                          height: height / 2.5,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width / 28, right: width / 28),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                // padding:   EdgeInsets.only(right: 32.w),
                                itemCount: menuCardsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return menuCardsList[index];
                                }),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 14, right: width / 14),
                        child: Transform.translate(
                          offset: Offset(
                              0.0,
                              height /
                                  4 *
                                  (1 - _animationButtonIn.value).toDouble()),
                          child: Opacity(
                            opacity: _animationButtonIn.value,
                           child: CommonLargeButton(
                              buttonTitle: 'Buy',
                              largeButtonColor: brandColor,
                              titleColor: Colors.white, onTap: () {},
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 18,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

