import 'package:flutter/material.dart';
import 'package:foodies/common_classes.dart';
import 'package:foodies/constantpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class FoodDetails extends StatefulWidget {
  final String image;
  final String itemName;
  final String price;

  const FoodDetails(
      {Key? key,
      required this.image,
      required this.itemName,
      this.price = 'Undefined'})
      : super(key: key);

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> with TickerProviderStateMixin{


  late AnimationController _animationControllerInFoodDetails;
  late Animation<double> _animationMiniRoundButtonOpacity;
  late Animation<double> _animationAllText;
  late Animation<double> _animationButtonIn;


  void _animationExecutionInFoodDetails() {

    _animationControllerInFoodDetails = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationMiniRoundButtonOpacity = CurvedAnimation(
        parent: _animationControllerInFoodDetails,
        curve: const Interval(0.0, 0.30, curve: Curves.fastLinearToSlowEaseIn));


    _animationAllText = CurvedAnimation(
        parent: _animationControllerInFoodDetails,
        curve: const Interval(0.30, 0.60, curve: Curves.fastLinearToSlowEaseIn));



    _animationButtonIn = CurvedAnimation(
        parent: _animationControllerInFoodDetails,
        curve:
        const Interval(0.60, 0.90, curve: Curves.fastLinearToSlowEaseIn));



    _animationControllerInFoodDetails.forward();
  }


  @override
  void initState() {
    _animationExecutionInFoodDetails();
    super.initState();
  }


  @override
  void dispose() {
    _animationControllerInFoodDetails.dispose();
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
          animation: _animationControllerInFoodDetails,

          builder : (context,_){
            return Scaffold(
              backgroundColor: lightAss,
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding:
                  EdgeInsets.only(top: height/18,bottom: height/28, left: width/13, right: width/13),
                  child: Column(
                    children: [
                      Opacity(
                        opacity: _animationMiniRoundButtonOpacity.value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child:
                                const ShortCircleButton(icon: Icons.arrow_back_ios,iconColor: white,circleColor: brandColor,)),
                            GestureDetector(
                                onTap: () {

                                },
                                child:
                                const ShortCircleButton(icon: Icons.favorite,iconColor: brandColor,circleColor: fadeBrandColor,)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 56,
                      ),
                      Hero(
                        tag: 'foodImage${widget.image}',
                        child: Container(
                          height: height/3.2,
                          width: width/1.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              image: DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 56,
                      ),
                      Opacity(
                        opacity: _animationAllText.value,
                        child: Container(
                          height:    MediaQuery.of(context).size.height /3.3,
                          width: double.infinity,


                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.itemName,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lobster(
                                    textStyle: TextStyle(
                                        fontSize: 45.sp,
                                        color: brandColor,
                                        fontWeight: FontWeight.bold)),
                              ),

                              Text(widget.price,
                                  style: TextStyle(
                                      fontSize: 30.sp,
                                      color: black,
                                      fontWeight: FontWeight.bold)),

                              Flexible(
                                child: Text('This is a big size ${widget.itemName}',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 25.sp,
                                        color: black,
                                        fontWeight: FontWeight.bold)),
                              ),

                              Flexible(child: Text('Try this special dish and enjoy your time',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: deepAss,
                                      fontWeight: FontWeight.bold))),
                            ],),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 28,
                      ),
                      Transform.translate(
                        offset: Offset(
                            0.0,
                            height/4.5 *
                                (1 - _animationButtonIn.value)
                                    .toDouble()),
                        child: CommonLargeButton(
                          largeButtonColor: brandColor,
                          buttonTitle: 'Order',
                          titleColor: white,
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }

        ));
  }
}
