import 'package:flutter/material.dart';
import 'package:foodies/widgets/common_classes.dart';
import 'package:foodies/utils/constantpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies/utils/rough_page.dart';
import 'package:masonry_grid/masonry_grid.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> with TickerProviderStateMixin{

  late AnimationController _animationControllerInFavourite;
  late Animation<double> _animationMiniRoundButtonScaleUp;
  late Animation<double> _animationAllText;
  late Animation<double> _animationCardListIn;
  late Animation<double> _animationNavigationBarOpacity;


  void _animationExecutionInFavourite() {

    _animationControllerInFavourite = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationMiniRoundButtonScaleUp = Tween(begin: 0.20, end: 1.00).animate(CurvedAnimation(
        parent: _animationControllerInFavourite,
        curve: const Interval(0.0, 0.30, curve: Curves.easeIn)));


    _animationAllText = CurvedAnimation(
        parent: _animationControllerInFavourite,
        curve: const Interval(0.20, 0.50, curve: Curves.fastLinearToSlowEaseIn));



    _animationCardListIn = CurvedAnimation(
        parent: _animationControllerInFavourite,
        curve: const Interval(0.40, 0.70, curve: Curves.fastLinearToSlowEaseIn));


    _animationNavigationBarOpacity = CurvedAnimation(
        parent: _animationControllerInFavourite,
        curve: const Interval(0.70, 1.0, curve: Curves.easeInSine));



    _animationControllerInFavourite.forward();
  }


  @override
  void initState() {
    _animationExecutionInFavourite();
    super.initState();
  }

  @override
  void dispose() {
    _animationControllerInFavourite.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: AnimatedBuilder(
          animation: _animationControllerInFavourite,
          builder: (context,_){
            return Scaffold(
              backgroundColor: lightAss,
              body: Padding(
                padding: EdgeInsets.only(
                  top: height/18,
                  bottom: height/56,
                  left: width/13,
                  right: width/13,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform.scale(
                              scale: _animationMiniRoundButtonScaleUp.value,
                              child: GestureDetector(
                                  onTap: (){
 Navigator.pop(context,false);                                  },
                                  child: const ShortCircleButton(icon: Icons.arrow_back_ios,iconColor: white,circleColor: brandColor,))),

                          Opacity(
                            opacity: _animationAllText.value,
                            child: Text(
                              'Favourites',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(height: 20.h,width: 20.w,color: transparent,)
                        ],
                      ),
                      SizedBox(
                        height: height/18,
                      ),
                      Opacity(
                        opacity: _animationCardListIn.value,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.2,
                          width: double.infinity,
                          child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                                child: MasonryGrid(column: 1, mainAxisSpacing: 16, children: const [
                                  FavouriteCard(image: 'images/pizza.png', itemName: "Beef Pizza", price: "1200 tk"),
                                  FavouriteCard(image: 'images/vagetable pasta.png', itemName: "Vegetable Pasta", price: "450 tk"),
                                  FavouriteCard(image: 'images/noodles.png', itemName: "Egg Noodles", price: "320 tk"),
                                  FavouriteCard(image: 'images/chicken nuggets.png', itemName: "Chicken Nuggets", price: "320 tk"),
                                  FavouriteCard(image: 'images/burger.png', itemName: "Burger", price: "320 tk"),
                                  FavouriteCard(image: 'images/seafood.png', itemName: "Sea Food", price: "320 tk"),
                                ]))
                          ],
                        ),

                        ),
                      ),
                      SizedBox(height: height/28,),
                    ],
                  ),
                ),
              ),
            );
          } ,
        ));
  }
}
