import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies/common_classes.dart';
import 'package:foodies/constantpage.dart';
import 'package:foodies/page_slider_from_right_side.dart';
import 'package:foodies/rough_page.dart';
import 'package:foodies/view/onBoard/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(DevicePreview(builder:(context)=> const MyApp(),enabled: !kReleaseMode,));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        // builder:     DevicePreview.appBuilder,

        debugShowCheckedModeBanner: false,
        builder:     DevicePreview.appBuilder,
        //     (context, widget) {
        //   ScreenUtil.setContext(context);
        //   return MediaQuery(
        //     //Setting font does not change with system font size
        //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        //     child: widget!,
        //   );
        // },

        theme: ThemeData(
          textTheme: TextTheme(
              //To support the following, you need to use the first initialization method
              button: TextStyle(fontSize: 45.sp)),
        ),
        // A widget which will be started on application startup
        home: const OnBoard(),
      ),
    );
  }
}



class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> with  TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animationBackgroundIn;
  late Animation<double> _animationFoodiesIn;
  late Animation<double> _animationButtonIn;
  late Animation<double> _animationListViewIn;

  late final AnimationController _animationPageRouteController =  AnimationController(vsync: this, duration:  const Duration(seconds: 2));

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
        parent: _animationController,
        curve: const Interval(0.0, 0.15, curve: Curves.easeIn));

    _animationFoodiesIn = Tween(begin: 0.20, end: 1.00).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.20, 0.50, curve: Curves.bounceInOut)));

    _animationButtonIn = CurvedAnimation(
        parent: _animationController,
        curve:
            const Interval(0.30, 0.60, curve: Curves.fastLinearToSlowEaseIn));

    _animationListViewIn = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.50, 0.80, curve: Curves.easeIn));


    // _animationLogoMovementUp = CurvedAnimation(
    //     parent: _animationController, curve: const Interval(0.30, 0.50));
    //
    // _animationBatmanIn = Tween(begin: 5.0, end: 1.0).animate(CurvedAnimation(
    //     parent: _animationController, curve: const Interval(0.50, 1.0, curve: Curves.decelerate)));
    //

    _animationController.forward();
  }



  @override
  void initState() {
    _animationExecution();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {


    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final PageController controller = PageController();

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(414, 896),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);

    return SafeArea(
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Scaffold(
                  backgroundColor: brandColor,
                  body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: height/18, bottom: height/28, left: width/13, right: width/13),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Transform.scale(
                                    scale: _animationFoodiesIn.value,
                                    child: const FoodiesCircle(
                                      circleSize: 80,
                                      circleColor: brandColorLight,
                                      textColor: white,
                                      fontSize: 14,
                                    )),
                                SizedBox(height:height/18),
                                Opacity(
                                  opacity: _animationListViewIn.value,
                                  child: Container(
                                    height: height/1.65,


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
                                      50.h *
                                          (1 - _animationButtonIn.value)
                                              .toDouble()),
                                  child: Opacity(
                                    opacity: (_animationButtonIn.value),
                                    child: CommonLargeButton(
                                      largeButtonColor: white,
                                      buttonTitle: 'Get Started',
                                      titleColor: brandColor,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageRoutingWithRightSlide(widget: const LogInPage())


                                        );
                                      },
                                    ),
                                  ),
                                ),

                              ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height/56),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: SmoothPageIndicator(
                                  controller: controller,
                                  count: 6,
                                  effect: WormEffect(
                                    dotHeight: 8.h,
                                    dotWidth: 8.w,
                                    dotColor: white,
                                    activeDotColor: brandColorLight,
                                  ),
                                  onDotClicked: (index) =>
                                      controller.animateToPage(index,
                                          duration:
                                              const Duration(microseconds: 200),
                                          curve: Curves.bounceOut),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ) ;
          }),
    );


  }
}
