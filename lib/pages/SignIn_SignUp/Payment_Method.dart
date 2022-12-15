import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fodee/Components/CustomButton.dart';
import 'package:fodee/pages/UploadPage.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  List logoList = [
    "assets/image/logo/paypal.png",
    "assets/image/logo/visa.png",
    "assets/image/logo/payoneer.png"
  ];
  int isClick=-1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            24.verticalSpace,
            Row(
              children: [
                24.horizontalSpace,
                Container(
                  height: 36.r,
                  width: 36.r,
                  padding: EdgeInsets.symmetric(
                      vertical: 10.32.r, horizontal: 13.61.r),
                  decoration: BoxDecoration(
                    color: Color(0xffF43F5E).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(9.82.r),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xffF43F5E).withOpacity(0.7),
                    size: 15.35,
                  ),
                ),
                24.horizontalSpace,
                Text(
                  'Payment method',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text(
                "This data will be displayed in your account profile for security",
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(24),
                  itemCount: logoList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        if (isClick == index) {
                          isClick = -1;
                        } else {
                          isClick = index;
                        }
                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 24,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 28.5.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isClick== index? Color(0xffFF1843) :Color(0xffEBEEF2),
                            width: isClick== index? 2: 1.25,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(12,26),
                              blurRadius: 50,
                              color: Color(0xff5A6CEA).withOpacity(0.08),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          height: 23,
                          child: Image.asset(
                            logoList[index],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              child: CustomButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => UploadPage()),
                  );
                  setState(() {});
                },
                title: "Next",
                isActive: isClick!=-1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
