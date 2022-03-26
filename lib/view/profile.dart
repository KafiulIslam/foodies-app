import 'package:flutter/material.dart';
import 'package:foodies/common_classes.dart';
import 'package:foodies/constantpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {



  late AnimationController _animationControllerInProfile;
  late Animation<double> _animationMiniRoundButtonScaleUpFirst;
  late Animation<double> _animationMiniRoundButtonScaleUpSecond;
  late Animation<double> _animationOpacity;
  late Animation<double> _animationTextFieldButtonIn;
  late Animation<double> _animationNavigationBarOpacity;


  void _animationExecutionInProfile() {

    _animationControllerInProfile = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationMiniRoundButtonScaleUpFirst = Tween(begin: 0.20, end: 1.00).animate(CurvedAnimation(
        parent: _animationControllerInProfile,
        curve: const Interval(0.0, 0.20, curve: Curves.easeIn)));

    _animationMiniRoundButtonScaleUpSecond = Tween(begin: 0.20, end: 1.00).animate(CurvedAnimation(
        parent: _animationControllerInProfile,
        curve: const Interval(0.20, 0.40, curve: Curves.easeIn)));


    _animationOpacity = CurvedAnimation(
        parent: _animationControllerInProfile,
        curve: const Interval(0.40, 0.60, curve: Curves.fastLinearToSlowEaseIn));


    _animationTextFieldButtonIn = CurvedAnimation(
        parent: _animationControllerInProfile,
        curve: const Interval(0.60, 0.80, curve: Curves.fastLinearToSlowEaseIn));


    _animationNavigationBarOpacity = CurvedAnimation(
        parent: _animationControllerInProfile,
        curve: const Interval(0.80, 1.0, curve: Curves.easeInSine));



    _animationControllerInProfile.forward();
  }


  @override
  void initState() {
    _animationExecutionInProfile();

    super.initState();
  }


  @override
  void dispose() {
    _animationControllerInProfile.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

final height = MediaQuery.of(context).size.height;
final width = MediaQuery.of(context).size.width;


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
          animation: _animationControllerInProfile,
          builder:(context,_){
            return Scaffold(
              backgroundColor: lightAss,
              body: Padding(
                padding: EdgeInsets.only(
                  top: height/28,
                  bottom: height/56,
                  left: width/13,
                  right:  width/13,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [

                     Container(height: height/3,width: double.infinity,

                       child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Transform.scale(
                           scale: _animationMiniRoundButtonScaleUpFirst.value,
                           child: Container(
                             alignment: Alignment.center,
                             height: height/4.48,
                             width: width/2.1,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(100),
                               color: fadeBrandColor,
                             ),
                             child: Opacity(
                               opacity: _animationOpacity.value,
                               child: Container(
                                 height: height/4.72,
                                 width: width/2.210526315789474,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(100),
                                   image: const DecorationImage(
                                     image: AssetImage('images/25834B.jpg'),
                                     fit: BoxFit.fill,
                                   ),
                                   color: brandColorLight,
                                 ),
                               ),
                             ),
                           ),
                         ),

                         Opacity(
                           opacity: _animationOpacity.value,
                           child: const Text(
                             'Kafiul Islam',
                             textAlign: TextAlign.start,
                             style: TextStyle(
                                 fontSize: 25,
                                 color: black,
                                 fontWeight: FontWeight.bold),
                           ),
                         ),
                       ],
                     ),),
                      Transform.translate(
                        offset: Offset(
                            0.0,
                            500.h *
                                (1 - _animationTextFieldButtonIn.value)
                                    .toDouble()),
                        child: Container(height: height/2,width: double.infinity,    child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:   [

                            const  CustomTextField(label: 'Name', hintText: 'Put your name'),
                            const CustomTextField(
                                label: 'Profession',
                                hintText: 'Which profession do you pursue?'),
                            const CustomTextField(
                                label: 'Address', hintText: 'Put your full adress'),
                            SizedBox(height: height/56,),
                            GestureDetector(
                              onTap: () {
                                // Navigator.pop(context, false);
                              },
                              child: Opacity(
                                opacity: _animationTextFieldButtonIn.value ,
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 50.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16.r),
                                        color: brandColor),
                                    child: Text('Save',
                                        style: TextStyle(
                                            fontSize: 32.sp,
                                            color: white,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),

                          ],
                        ),),
                      ),


                      SizedBox(height: height/56,),


                    ],
                  ),
                ),
              ),
            );
          } ,
        ));
  }
}
