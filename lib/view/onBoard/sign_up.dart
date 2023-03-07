import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies/widgets/common_classes.dart';
import 'package:foodies/utils/constantpage.dart';
import 'package:foodies/view/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    int selectButton = 2;
    ScreenUtil.init(context, designSize: const Size(320, 660));

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
                    const CustomTextField(
                        label: 'Password', hintText: '*********'),
                    const CustomTextField(
                        label: 'Confirm Password', hintText: '*********'),
                    CommonLargeButton(
                      largeButtonColor: brandColor,
                      buttonTitle: 'Sign Up',
                      titleColor: white,
                     onTap: (){
                       Navigator.push(context,MaterialPageRoute(builder: (context) => const Home()));
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
