import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fodee/Components/SearchAndFilter.dart';
import 'package:fodee/Components/background.dart';
import 'package:fodee/Model/UserModel.dart';
import 'package:fodee/pages/Home/MenuPage.dart';
import 'package:fodee/store/local_store.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/MenuModel.dart';
import '../../Model/PromoModel.dart';
import '../../Model/RestaurantModel.dart';
import 'PopularRestaurant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  String imagePath = "";

  Future<void> getInfo() async {
    LocalStore local = LocalStore();
    UserModel user = await local.getUser();
    name = user.fullName;
    imagePath = user.image;
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

  List<MenuModel> listOfMenu = [
    MenuModel(
      image: "assets/image/menu/Original Salad.jpg",
      name: 'Original Salad',
      restaurant: 'Lovy Food',
      price: 8,
    ),
    MenuModel(
      image: "assets/image/menu/Fresh Salad.jpg",
      name: 'Fresh Salad',
      restaurant: 'Cloudy Resto',
      price: 10,
    ),
    MenuModel(
      image: "assets/image/menu/ice cream.jpg",
      name: 'Yummie Ice Cream',
      restaurant: 'Circlo Resto',
      price: 6,
    ),
    MenuModel(
      image: "assets/image/menu/Vegan Special.jpg",
      name: 'Vegan Special',
      restaurant: 'Haty Food',
      price: 11,
    ),
    MenuModel(
      image: "assets/image/menu/mixed pasta.jpg",
      name: 'Mixed Pasta',
      restaurant: 'Recto Food',
      price: 13,
    ),
  ];

  List<PromoModel> listOfPromo = [
    PromoModel(
      image: "assets/image/product/burger.png",
      title: 'Special Deal for December',
      backgroundColor: [Color(0xffFF1843), Color(0xffFF7E95)],
      buyBackground: Color(0xffFFB800),
    ),
    PromoModel(
      image: "assets/image/product/pizza1.png",
      title: 'Special Deal for December',
      backgroundColor: [Color(0xffFFB800), Color(0xffFFDA7B)],
      buyBackground: Color(0xffFF3A5D),
    ),
    PromoModel(
      image: "assets/image/product/pizza2.png",
      title: 'Special Deal for December',
      backgroundColor: [Color(0xff1EC87B), Color(0xff10EB89)],
      buyBackground: Color(0xffFFB800),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: SafeArea(
          child: Column(children: [
            32.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Row(
                children: [
                  Container(
                    height: 36.r,
                    width: 36.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.r),
                      image: DecorationImage(
                        image: FileImage(
                          File(imagePath),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
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
            32.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: SearchAndFilter(
                onChanged: () {},
                onTapFilter: () {},
              ),
            ),
            6.h.verticalSpace,
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 12),
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 244.h,
                    child: ListView.builder(
                        itemCount: listOfPromo.length,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 20.h),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 32.w),
                            height: 180.h,
                            width: MediaQuery.of(context).size.width - 44,
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
                                      ...listOfPromo[index].backgroundColor,
                                    ])),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 166.w,
                                  child: Image.asset(
                                    listOfPromo[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                18.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    children: [
                                      10.verticalSpace,
                                      Text(
                                        listOfPromo[index].title,
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
                                          color: listOfPromo[index].buyBackground,
                                          borderRadius:
                                              BorderRadius.circular(32),
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
                          );
                        }),
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
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => PopularRestaurant(
                                      listOfRestaurant: listOfRestaurant,
                                    )));
                          },
                          child: Text(
                            "See all",
                            style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(
                                0xffF43F5E,
                              ),
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
                        itemCount: listOfRestaurant.length ~/ 2 + 1,
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
                            margin: EdgeInsets.only(
                                right: 24.w, top: 32.h, bottom: 32.h),
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
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>
                                    MenuPage(listOfMenu: listOfMenu)));
                          },
                          child: Text(
                            "See all",
                            style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(
                                0xffF43F5E,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  32.h.verticalSpace,
                  SizedBox(
                    height: 136.h,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: listOfMenu.length ~/ 2 + 1,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 24.h),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 24),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff5A6CEA).withOpacity(0.08),
                                    offset: Offset(12, 26),
                                    blurRadius: 50,
                                  )
                                ]),
                            padding: EdgeInsets.all(12.r),
                            height: 100.h,
                            width: MediaQuery.of(context).size.width - 48,
                            child: Row(
                              children: [
                                Container(
                                  height: 64.r,
                                  width: 64.r,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      image: DecorationImage(
                                        image:
                                            AssetImage(listOfMenu[index].image),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                20.w.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listOfMenu[index].name,
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    4.h.verticalSpace,
                                    Text(
                                      listOfMenu[index].restaurant,
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
                                  "\$${listOfMenu[index].price}",
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 29,
                                    color: Color(0xffF43F5E),
                                  ),
                                ),
                                20.w.horizontalSpace,
                              ],
                            ),
                          );
                        }),
                  ),
                  100.h.verticalSpace,
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
