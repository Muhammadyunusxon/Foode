import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fodee/Components/CustomAppBar.dart';
import 'package:fodee/Components/SearchAndFilter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/RestaurantModel.dart';

class PopularRestaurant extends StatefulWidget {
  final List<RestaurantModel> listOfRestaurant;
  const PopularRestaurant({Key? key, required this.listOfRestaurant}) : super(key: key);

  @override
  State<PopularRestaurant> createState() => _PopularRestaurantState();
}

class _PopularRestaurantState extends State<PopularRestaurant> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "Popular Restaurant"),
            36.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SearchAndFilter(
                onChanged: () {},
                onTapFilter: () {},
              ),
            ),
            2.h.verticalSpace,
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24,vertical: 30),
                itemCount: widget.listOfRestaurant.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 32,
                    crossAxisSpacing: 24,
                    mainAxisExtent: 184.h,
                ),
                itemBuilder: (context,index){
                  return  Container(
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
                    height: 184.h,
                    width: 160.w,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60.h,
                          child: SvgPicture.asset(
                            widget.listOfRestaurant[index].logo,
                            height: 60,
                            width: 50,
                            color: widget.listOfRestaurant[index].logoColor,
                          ),
                        ),
                        20.verticalSpace,
                        Text(
                          widget.listOfRestaurant[index].title,
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        3.verticalSpace,
                        Text(
                          "${ widget.listOfRestaurant[index].time} mins",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 14,
                              color: Color(
                                0xff6D7580,
                              )),
                        ),
                      ],
                    ),
                  );
                },),
            )
          ],
        ),
      ),
    );
  }
}
