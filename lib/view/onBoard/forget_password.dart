import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies/common_classes.dart';
import 'package:foodies/constantpage.dart';
import 'package:foodies/view/home_page.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>
    with  TickerProviderStateMixin {


  late AnimationController _animationControllerInForgetPassword;
  late Animation<double> _animationCustomCardIn;
  late Animation<double> _animationTextFieldIn;
  late Animation<double> _animationButtonIn;


  void _animationExecutionInForgetPassword() {

    _animationControllerInForgetPassword =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationCustomCardIn =  CurvedAnimation(
        parent: _animationControllerInForgetPassword , curve: const Interval(0.0, 0.30));


    // _animationCustomCardIn = Tween(begin: 5.0, end: 1.0).animate(CurvedAnimation(
    //     parent: _animationControllerForLoginPage, curve: const Interval(0.0, 0.30, curve: Curves.decelerate)));

    _animationTextFieldIn = Tween(begin: 50.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationControllerInForgetPassword, curve: const Interval(0.30, 0.60,curve: Curves.easeIn)));



    _animationButtonIn = CurvedAnimation(
        parent: _animationControllerInForgetPassword,
        curve: const Interval(0.60, 0.90, curve: Curves.easeIn));


    _animationControllerInForgetPassword.forward();
  }


  @override
  void initState() {
    _animationExecutionInForgetPassword();
    super.initState();
  }


  @override
  void dispose() {
    _animationControllerInForgetPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int selectButton = 0;

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(414, 896),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);

    return SafeArea(
        child: Scaffold(
      backgroundColor: ass,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCard(
              selectButton: selectButton,
            ),
            Container(
              height: 580.h,
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
                      height: 200.h,
                    ),
                    CommonLargeButton(
                      largeButtonColor: brandColor,
                      buttonTitle: 'Recover',
                      titleColor: white,
                      onTap: (){
                        // Navigator.push(context,MaterialPageRoute(builder: (context) => const Home()));
                        Navigator.pop(context,false);
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
