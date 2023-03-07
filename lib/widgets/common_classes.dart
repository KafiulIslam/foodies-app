import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies/routes/router.gr.dart';
import 'package:foodies/utils/constantpage.dart';
import 'package:foodies/view/favourite_page.dart';
import 'package:foodies/view/food_details.dart';
import 'package:foodies/view/home_page.dart';
import 'package:foodies/view/onBoard/login_page.dart';
import 'package:foodies/view/profile.dart';
import 'package:foodies/view/onBoard/sign_up.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CommonLargeButton extends StatelessWidget {
  final Color largeButtonColor;
  final String buttonTitle;
  final Color titleColor;
  final VoidCallback onTap;

  const CommonLargeButton(
      {Key? key,
      required this.largeButtonColor,
      required this.buttonTitle,
      required this.titleColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            alignment: Alignment.center,
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: largeButtonColor),
            child: Text(buttonTitle,
                style: TextStyle(
                    fontSize: 32,
                    color: titleColor,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}

class OnBoardClass extends StatefulWidget {
  final String productName;
  final String image;

  const OnBoardClass({Key? key, required this.productName, required this.image})
      : super(key: key);

  @override
  _OnBoardClassState createState() => _OnBoardClassState();
}

class _OnBoardClassState extends State<OnBoardClass>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.productName,
            style: GoogleFonts.lobster(
                textStyle: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))),
        SizedBox(height: height / 56),
        Container(
            height: height / 2.56,
            width: width / 1.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.fill,
                ))),
      ],
    );
  }
}

class FoodiesCircle extends StatelessWidget {
  final double circleSize;
  final Color circleColor;
  final Color textColor;
  final double fontSize;

  const FoodiesCircle(
      {Key? key,
      required this.circleSize,
      required this.circleColor,
      required this.textColor,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: circleSize / 2,
      backgroundColor: circleColor,
      child: Text(
        'Foodies',
        style: GoogleFonts.lobster(
            textStyle: TextStyle(fontSize: fontSize, color: textColor)),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  late int selectButton;
  late double offsetDX;
  late double offsetDY;

  CustomCard({
    Key? key,
    required this.selectButton,
    this.offsetDX = 0.0,
    this.offsetDY = 0.0,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(320, 660));

    return Transform.translate(
      offset: Offset(widget.offsetDX, widget.offsetDY),
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
              padding: EdgeInsets.only(top: 75.h, bottom: 50.h),
              child: FoodiesCircle(
                  circleSize: 150,
                  circleColor: brandColor,
                  textColor: white,
                  fontSize: 30),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.selectButton = 1;
                      if (widget.selectButton == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInPage()));
                      }
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sing In',
                            style: GoogleFonts.cabin(
                                textStyle: TextStyle(
                                    fontSize: 18.sp,
                                    color: widget.selectButton == 1
                                        ? black
                                        : deepAss,
                                    fontWeight: FontWeight.bold))),
                        Container(
                          height: 3.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: widget.selectButton == 1
                                ? brandColor
                                : Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.selectButton = 2;
                      if (widget.selectButton == 2) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      }
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sing Up',
                            style: GoogleFonts.cabin(
                                textStyle: TextStyle(
                                    fontSize: 18.sp,
                                    color: widget.selectButton == 2
                                        ? black
                                        : deepAss,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            height: 3.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: widget.selectButton == 2
                                  ? brandColor
                                  : Colors.transparent,
                              // color: brandColor,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;

  const CustomTextField({Key? key, required this.label, required this.hintText})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(320, 660));

    return Container(
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1.0, color: brandColor),
      )),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          label: Text(
            widget.label,
            style: TextStyle(
              fontSize: 16.sp,
              color: black,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 16.sp, color: deepAss),
        ),
      ),
    );
  }
}

class TextWithBar extends StatefulWidget {
  final String item;
  final Color textColor;
  final Color barColor;

  const TextWithBar(
      {Key? key,
      required this.item,
      required this.textColor,
      required this.barColor})
      : super(key: key);

  @override
  _TextWithBarState createState() => _TextWithBarState();
}

class _TextWithBarState extends State<TextWithBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.item,
          style: GoogleFonts.lobster(
            textStyle: TextStyle(fontSize: 16, color: widget.textColor),
          ),
        ),
        Container(
          height: 3,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: widget.barColor,
          ),
        )
      ],
    );
  }
}

class MenuCard extends StatefulWidget {
  final String itemName;
  final String price;
  final String image;

  const MenuCard(
      {Key? key,
      required this.image,
      required this.itemName,
      required this.price})
      : super(key: key);

  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        context.router.push(SingleFood(
            image: widget.image,
            itemName: widget.itemName,
            price: widget.price));
      },
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: height / 2.8,
            width: width / 2,
          ),
          Positioned(
            top: height / 12.8,
            child: SizedBox(
                height: height / 3.5,
                width: width / 2,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33.0),
                  ),
                  elevation: 3,
                  color: white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.itemName,
                        style: GoogleFonts.lobster(
                            textStyle: const TextStyle(
                          fontSize: 28,
                          color: brandColor,
                        )),
                      ),
                      SizedBox(
                        height: height / 56,
                      ),
                      Text(widget.price,
                          style: const TextStyle(
                            fontSize: 18,
                            color: black,
                          )),
                      SizedBox(
                        height: height / 56,
                      ),
                    ],
                  ),
                )),
          ),
          Positioned(
              bottom: height / 4.7,
              left: width / 25,
              child: Hero(
                tag: 'foodImage${widget.image}',
                child: Container(
                  height: height / 5.6,
                  width: width / 2.625,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.fill,
                      )),
                ),
              )),
        ],
      ),
    );
  }
}

class ShortCircleButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color circleColor;

  const ShortCircleButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.circleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(320, 660));
    return CircleAvatar(
      radius: 20,
      backgroundColor: circleColor,
      child: Icon(
        icon,
        size: 20,
        color: iconColor,
      ),
    );
  }
}

class MenuCardInSearchPage extends StatefulWidget {
  final String image;
  final String item;
  final String price;

  const MenuCardInSearchPage({
    Key? key,
    required this.image,
    required this.item,
    required this.price,
  }) : super(key: key);

  @override
  _MenuCardInSearchPageState createState() => _MenuCardInSearchPageState();
}

class _MenuCardInSearchPageState extends State<MenuCardInSearchPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(320, 660));

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(33.0.r),
      ),
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150.h,
            width: 150.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.fill,
                )),
          ),
          Text(
            widget.item,
            style: GoogleFonts.lobster(
                textStyle: TextStyle(
              fontSize: 28.sp,
              color: brandColor,
            )),
          ),
          Text(widget.price,
              style: TextStyle(
                fontSize: 18.sp,
                color: black,
              ))
        ],
      ),
    );
  }
}

class CustomNavigationBar extends StatefulWidget {
  late int selectedIndex;

  CustomNavigationBar({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Favourite(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(320, 660));

    return Container(
      height: 50.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              alignment: Alignment.center,
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: widget.selectedIndex == 0 ? fadeBrandColor : transparent,
              ),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.selectedIndex = 0;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  icon: const Icon(
                    Icons.home,
                    size: 20,
                    color: brandColor,
                  ))),
          Container(
              alignment: Alignment.center,
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: widget.selectedIndex == 1 ? fadeBrandColor : transparent,
              ),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.selectedIndex = 1;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Favourite()));
                  },
                  icon: const Icon(
                    Icons.favorite,
                    size: 20,
                    color: brandColor,
                  ))),
          Container(
              alignment: Alignment.center,
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: widget.selectedIndex == 2 ? fadeBrandColor : transparent,
              ),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.selectedIndex = 2;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                  icon: const Icon(
                    Icons.person,
                    size: 20,
                    color: brandColor,
                  ))),
        ],
      ),
    );
  }
}

class FavouriteCard extends StatelessWidget {
  final String image;
  final String itemName;
  final String price;

  const FavouriteCard({
    Key? key,
    required this.image,
    required this.itemName,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height / 5.9,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: white,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: width / 56, right: width / 56),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: height / 7.46,
              width: MediaQuery.of(context).size.width / 3.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      itemName,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: false,
                      style: const TextStyle(
                        fontSize: 18,
                        color: brandColor,
                      ),
                    ),
                  ),
                  SizedBox(height: height / 112),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      color: black,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.clear,
                  color: Colors.red,
                  size: 25,
                ))
          ],
        ),
      ),
    );
  }
}
