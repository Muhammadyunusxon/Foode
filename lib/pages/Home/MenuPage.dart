import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fodee/Model/MenuModel.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/CustomAppBar.dart';
import '../../Components/SearchAndFilter.dart';
class MenuPage extends StatefulWidget {
  final List<MenuModel> listOfMenu;
  const MenuPage({Key? key, required this.listOfMenu}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "Popular Menu"),
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
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: widget.listOfMenu.length ,
                  padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 30.h),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 24),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff5A6CEA).withOpacity(0.08),
                              offset: Offset(12,26),
                              blurRadius: 50,
                            )
                          ]
                      ),
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
                                  AssetImage( widget.listOfMenu[index].image),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          20.w.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.listOfMenu[index].name,
                                style: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                              4.h.verticalSpace,
                              Text(
                                widget.listOfMenu[index].restaurant,
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
                            "\$${ widget. listOfMenu[index].price}",
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
            )
          ],
        ),
      ),
    );
  }
}
