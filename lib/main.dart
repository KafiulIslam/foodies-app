import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodies/routes/router.gr.dart';
import 'package:foodies/widgets/common_classes.dart';
import 'package:foodies/utils/constantpage.dart';
import 'package:foodies/view/onBoard/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Foodies',
      theme: ThemeData(
          primarySwatch: Colors.teal,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> with TickerProviderStateMixin {

  AnimationController? _animationController;
  Animation<double>?  _animationBackgroundIn;
  Animation<double>?  _animationFoodiesIn;
  Animation<double>? _animationButtonIn;
  Animation<double>? _animationListViewIn;

  late final AnimationController _animationPageRouteController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 1.0),
    end: const Offset(1.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _animationPageRouteController,
    curve: Curves.easeIn,
  ));

  void _animationExecution() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationBackgroundIn = CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(0.0, 0.15, curve: Curves.easeIn));

    _animationFoodiesIn = Tween(begin: 0.20, end: 1.00).animate(CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(0.20, 0.50, curve: Curves.bounceInOut)));

    _animationButtonIn = CurvedAnimation(
        parent: _animationController!,
        curve:
            const Interval(0.30, 0.60, curve: Curves.fastLinearToSlowEaseIn));

    _animationListViewIn = CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(0.50, 0.80, curve: Curves.easeIn));

    // _animationLogoMovementUp = CurvedAnimation(
    //     parent: _animationController, curve: const Interval(0.30, 0.50));
    //
    // _animationBatmanIn = Tween(begin: 5.0, end: 1.0).animate(CurvedAnimation(
    //     parent: _animationController, curve: const Interval(0.50, 1.0, curve: Curves.decelerate)));
    //

    _animationController!.forward();
  }

  @override
  void initState() {
    _animationExecution();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final PageController controller = PageController();

    return SafeArea(
      child: AnimatedBuilder(
          animation: _animationController!,
          builder: (context, _) {
            return Scaffold(
              backgroundColor: brandColor,
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: height / 18,
                          bottom: height / 28,
                          left: width / 13,
                          right: width / 13),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.scale(
                                scale: _animationFoodiesIn!.value,
                                child: const FoodiesCircle(
                                  circleSize: 80,
                                  circleColor: brandColorLight,
                                  textColor: white,
                                  fontSize: 14,
                                )),
                            SizedBox(height: height / 18),
                            Opacity(
                              opacity: _animationListViewIn!.value,
                              child: Container(
                                height: height / 1.65,
                                width: double.infinity,
                                child: PageView(
                                  controller: controller,
                                  children: const <Widget>[
                                    OnBoardClass(
                                        productName: "Beef\nPizza",
                                        image: 'images/pizza.png'),
                                    OnBoardClass(
                                        productName: "Chicken\nBurger",
                                        image: 'images/burger.png'),
                                    OnBoardClass(
                                        productName: "Egg\nNoodles",
                                        image: 'images/noodles.png'),
                                    OnBoardClass(
                                        productName: "Vegetable\nPasta",
                                        image: 'images/vagetable pasta.png'),
                                    OnBoardClass(
                                        productName: "Chicken\nNuggets",
                                        image: 'images/chicken nuggets.png'),
                                    OnBoardClass(
                                        productName: "Sea\nFoods",
                                        image: 'images/seafood.png'),
                                  ],
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(
                                  0.0,
                                  50 *
                                      (1 - _animationButtonIn!.value)
                                          .toDouble()),
                              child: Opacity(
                                opacity: (_animationButtonIn!.value),
                                child: CommonLargeButton(
                                  largeButtonColor: white,
                                  buttonTitle: 'Get Started',
                                  titleColor: brandColor,
                                  onTap: () {
                                    context.router.replace(const LogInPageRoute());
                                 //   Navigator.push(context, MaterialPageRoute(builder: (_) => const LogInPage()));
                                  },
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 56),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: SmoothPageIndicator(
                              controller: controller,
                              count: 6,
                              effect: const WormEffect(
                                dotHeight: 8,
                                dotWidth: 8,
                                dotColor: white,
                                activeDotColor: brandColorLight,
                              ),
                              onDotClicked: (index) => controller.animateToPage(
                                  index,
                                  duration: const Duration(microseconds: 200),
                                  curve: Curves.bounceOut),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
