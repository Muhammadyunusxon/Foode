import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodee/Components/backgraund.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/RestaurantModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";

  Future<void> getInfo() async {
    SharedPreferences _local = await SharedPreferences.getInstance();
    name = _local.getString("fullName") ?? "";
    setState(() {});
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  List<RestaurantModel> listOfRestaurant = [
    RestaurantModel(
      logo: "assets/svg/Restaurant/Lovy Food.svg",
      title: "Lovy Food",
      time: 10,
      logoColor: Color(0xffFF5272),
    ),
    RestaurantModel(
      logo: "assets/svg/Restaurant/Cloudy Resto.svg",
      title: "Cloudy Resto",
      time: 13,
      logoColor: Color(0xffFFCC45),
    ),
    RestaurantModel(
      logo: "assets/svg/Restaurant/Circlo Resto.svg",
      title: "Circlo Resto",
      time: 11,
      logoColor: Color(0xff4283FF),
    ),
    RestaurantModel(
      logo: "assets/svg/Restaurant/Haty Food.svg",
      title: "Haty Food",
      time: 16,
      logoColor: Color(0xff46D57D),
    ),
    RestaurantModel(
      logo: "assets/svg/Restaurant/Hearthy Resto.svg",
      title: "Hearthy Resto",
      time: 18,
      logoColor: Color(0xffFFC531),
    ),
    RestaurantModel(
      logo: "assets/svg/Restaurant/Recto Food.svg",
      title: "Recto Food",
      time: 15,
      logoColor: Color(0xffFF5272),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: SafeArea(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Row(
                children: [
                  SizedBox(
                    height: 36.r,
                    child: Image.asset("assets/image/Foode_logo.png"),
                  ),
                  16.horizontalSpace,
                  SizedBox(
                    width: 270.w,
                    child: Text(
                      "Hello, ${name} !",
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  16.horizontalSpace,
                  Container(
                      height: 44.r,
                      width: 44.r,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xffF6F8FB),
                          borderRadius: BorderRadius.circular(9.82.r),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 50,
                              color: Color(0xff5A6CEA).withOpacity(0.08),
                            )
                          ]),
                      child: SvgPicture.asset(
                        "assets/svg/notification.svg",
                        height: 24.r,
                        width: 24.r,
                        color: Color(0xffF43F5E),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4 * 3,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF4F6F9),
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 26.w),
                          child: SvgPicture.asset(
                            "assets/svg/Search.svg",
                            color: Color(0xff858C94),
                          ),
                        ),
                        hintText: "Search",
                        hintStyle: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff09101D).withOpacity(0.8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 28.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.r),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      height: 44.r,
                      width: 44.r,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xffF43F5E).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(9.82.r),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 50,
                              color: Color(0xff5A6CEA).withOpacity(0.08),
                            )
                          ]),
                      child: SvgPicture.asset(
                        "assets/svg/filter.svg",
                        height: 24.r,
                        width: 24.r,
                        color: Color(0xffF43F5E),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Container(
                height: 180.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 22,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xffFF7E95),
                          Color(0xffFF1843).withOpacity(0.8),
                        ])),
                child: Row(
                  children: [
                    SizedBox(
                      width: 166.w,
                      child: Image.asset(
                        "assets/image/product/burger.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    18.horizontalSpace,
                    Expanded(
                      child: Column(
                        children: [
                          10.verticalSpace,
                          Text(
                            "Special Deal for December",
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          10.verticalSpace,
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 32.w),
                            decoration: BoxDecoration(
                              color: Color(0xffFFB800),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Text(
                              "Buy Now",
                              style: GoogleFonts.sourceSansPro(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Restaurant",
                    style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(
                        0xffF43F5E,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 248.h,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: listOfRestaurant.length,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.r),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(12.h, 26.w),
                              blurRadius: 50,
                              color: Color(0xff5A6CEA).withOpacity(0.08),
                            )
                          ]),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 22.h),
                      margin:
                          EdgeInsets.only(right: 24.w, top: 32.h, bottom: 32.h),
                      height: 184.h,
                      width: 160.w,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60.h,
                            child: SvgPicture.asset(
                              listOfRestaurant[index].logo,
                              height: 60,
                              width: 50,
                              color: listOfRestaurant[index].logoColor,
                            ),
                          ),
                          20.verticalSpace,
                          Text(
                            listOfRestaurant[index].title,
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          3.verticalSpace,
                          Text(
                            "${listOfRestaurant[index].time} mins",
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 14,
                                color: Color(
                                  0xff6D7580,
                                )),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Menu",
                    style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(
                        0xffF43F5E,
                      ),
                    ),
                  )
                ],
              ),
            ),
            32.h.verticalSpace,
            Container(
              padding: EdgeInsets.all(12.r),
              child: Row(
                children: [
                  20.w.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Spicy Burger",
                        style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                        ),
                      ),
                      4.h.verticalSpace,
                      Text(
                        "Lovy Food",
                        style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Color(0xff858C94),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    "\$12",
                    style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w600,
                      fontSize: 29,
                      color: Color(0xffF43F5E),
                    ),
                  ),
                  20.w.horizontalSpace,
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
