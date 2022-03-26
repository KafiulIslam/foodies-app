import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies/common_classes.dart';
import 'package:foodies/constantpage.dart';
import 'package:foodies/page_slider_from_right_side.dart';
import 'package:foodies/rough_page.dart';
import 'package:foodies/view/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> with TickerProviderStateMixin {


  List<int> index = [1, 2, 3];
  int selectButton = 1;


  late AnimationController _animationControllerForLoginPage;
  late Animation<double> _animationCustomCardIn;
  late Animation<double> _animationLowerContainerIn;
  late Animation<double> _animationTextIn;
  late Animation<double> _animationButtonTranslateIn;



  late AnimationController _animationControllerForSignAndForgetLower;
  late Animation<Offset> _animationForSignForgetLower;


  void _animationExecutionForLoginPage() {
    _animationControllerForLoginPage =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationCustomCardIn = CurvedAnimation(
        parent: _animationControllerForLoginPage,
        curve: const Interval(0.0, 0.30));

    // _animationCustomCardIn = Tween(begin: 5.0, end: 1.0).animate(CurvedAnimation(
    //     parent: _animationControllerForLoginPage, curve: const Interval(0.0, 0.30, curve: Curves.decelerate)));

    _animationLowerContainerIn = Tween(begin: 50.0, end: 1.0).animate(CurvedAnimation(
            parent: _animationControllerForLoginPage,
            curve: const Interval(0.30, 0.50, curve: Curves.easeIn)));

    _animationTextIn = CurvedAnimation(
        parent: _animationControllerForLoginPage,
        curve: const Interval(0.50, 0.80, curve: Curves.easeIn));

    _animationButtonTranslateIn = CurvedAnimation(
        parent: _animationControllerForLoginPage,
        curve: const Interval(0.70, 1.00, curve: Curves.easeIn));

    _animationControllerForLoginPage.forward();
  }


  void slideAnimationForLowerContainer() {


    _animationControllerForSignAndForgetLower = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();


    _animationForSignForgetLower = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -0.81),
    ).animate(CurvedAnimation(
      parent: _animationControllerForSignAndForgetLower,
      curve: Curves.fastLinearToSlowEaseIn,
    ));


  }


  @override
  void initState() {
    _animationExecutionForLoginPage();

    super.initState();
  }

  @override
  void dispose() {
    _animationControllerForLoginPage.dispose();

    _animationControllerForSignAndForgetLower.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(414, 896),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);


    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;


    return SafeArea(
      child: AnimatedBuilder(
          animation:  _animationControllerForLoginPage,
          builder: (context, _) {
            return Scaffold(
              backgroundColor: ass,
              body: SingleChildScrollView(

                scrollDirection: Axis.vertical,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: Offset(0.0,400.0 * _animationCustomCardIn.value),
                      child: Transform.translate(
                        offset: const Offset(0.0, -400.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(33.r),
                                bottomRight: Radius.circular(33.r)),
                          ),
                          elevation: 3,
                          color: white,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: height/11.5, bottom: height/17.5),
                                child: const  FoodiesCircle(
                                    circleSize: 150,
                                    circleColor: brandColor,
                                    textColor: white,
                                    fontSize: 30),
                              ),
                              Padding(
                                padding:   EdgeInsets.only(left: 32.w,right: 32.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectButton = index[0];

                                        });
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Sing In',
                                              style: GoogleFonts.cabin(
                                                  textStyle: TextStyle(
                                                      fontSize: 18.sp,
                                                      color: selectButton ==1 ? black : deepAss,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Container(
                                            height: 3.h,
                                            width: MediaQuery.of(context).size.width / 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              color: selectButton == 1 ? brandColor : transparent,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectButton = index[1];
                                          slideAnimationForLowerContainer();

                                        });
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Sing Up',
                                              style: GoogleFonts.cabin(
                                                  textStyle: TextStyle(
                                                      fontSize: 18.sp,
                                                      color: selectButton == 2 ? black : deepAss,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Container(
                                              height: 3.h,
                                              width: MediaQuery.of(context).size.width / 3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                color: selectButton == 2 ? brandColor : transparent,

                                                // color: brandColor,
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),


                   selectButton == 1 ?

                       Transform.translate(
                          offset:
                              Offset(0.0, 10 * _animationLowerContainerIn.value),
                          child: Container(

                            height: MediaQuery.of(context).size.height / 1.8,
                            width: double.infinity,
                            // color: ass,
                            child: Padding(
                              padding: EdgeInsets.only(left: 32.w, right: 32.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomTextField(
                                      label: 'Email',
                                      hintText: '.......@gmail.com'),
                                  const CustomTextField(
                                      label: 'Password', hintText: '*********'),
                                  Opacity(
                                    opacity: _animationTextIn.value,
                                    child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            selectButton = index[2];
                                            slideAnimationForLowerContainer();
                                          });

                                        },
                                        child: Text('Forget Password',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: brandColor,
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  Opacity(
                                    opacity: _animationButtonTranslateIn.value,
                                    child: CommonLargeButton(
                                      largeButtonColor: brandColor,
                                      buttonTitle: 'Sign In',
                                      titleColor: white,
                                      onTap: () {
                                        Navigator.push(context, PageRoutingWithRightSlide(widget: const NavigationBarBoard()));


                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )

                    :  selectButton == 2 ?
                   SlideTransition(
                     position: _animationForSignForgetLower,
                     child: Transform.translate(
                       offset:   Offset(0.0,height/2.2),
                       child: Container(
                         height: MediaQuery.of(context).size.height / 1.8,
                         width: double.infinity,
                         color: ass,
                         child: Padding(
                           padding: EdgeInsets.only(left: 32.w, right: 32.w),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               const CustomTextField(
                                   label: 'Email', hintText: '.......@gmail.com'),
                               const CustomTextField(
                                   label: 'Password', hintText: '*********'),
                               const CustomTextField(
                                   label: 'Confirm Password', hintText: '*********'),
                               Opacity(
                                 opacity: _animationButtonTranslateIn.value,
                                 child: CommonLargeButton(
                                   largeButtonColor: brandColor,
                                   buttonTitle: 'Sign Up',
                                   titleColor: white,
                                   onTap: (){
                                     Navigator.push(context,PageRoutingWithRightSlide(widget: const NavigationBarBoard()));

                                   },
                                 ),
                               )
                             ],
                           ),
                         ),
                       ),
                     ),
                   ) :
                   SlideTransition(
                     position: _animationForSignForgetLower,
                     child: Transform.translate(
                       offset:    Offset(0.0,height/2.2),
                       child: Container(
                         height: MediaQuery.of(context).size.height / 1.8,
                         width: double.infinity,
                         color: ass,
                         child: Padding(
                           padding: EdgeInsets.only(left: 32.w, right: 32.w),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               const CustomTextField(
                                   label: 'Email', hintText: '.......@gmail.com'),
                               SizedBox(
                                 height: MediaQuery.of(context).size.height / 6,
                               ),
                               Opacity(
                                 opacity: _animationButtonTranslateIn.value,
                                 child: CommonLargeButton(
                                   largeButtonColor: brandColor,
                                   buttonTitle: 'Recover',
                                   titleColor: white,
                                   onTap: (){
                                     Navigator.push(context,PageRoutingWithRightSlide(widget: const NavigationBarBoard()));

                                   },
                                 ),
                               )
                             ],
                           ),
                         ),
                       ),
                     ),
                   )
                  ],
                ),
              ),
            );
          }),
    );
  }
}




