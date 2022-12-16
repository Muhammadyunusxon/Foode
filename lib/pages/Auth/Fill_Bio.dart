import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fodee/Components/CustomButton.dart';
import 'package:fodee/Components/OnFocusTap.dart';
import 'package:fodee/Model/UserModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Payment_Method.dart';

class FillBioPage extends StatefulWidget {
  const FillBioPage({Key? key}) : super(key: key);

  @override
  State<FillBioPage> createState() => _FillBioPageState();
}

class _FillBioPageState extends State<FillBioPage> {
  final ImagePicker _picker = ImagePicker();

  Map<String, TextEditingController> fillController = {
    "fullName": TextEditingController(),
    "nickName": TextEditingController(),
    "phoneNumber": TextEditingController(),
    "gender": TextEditingController(),
    "dateOfBirth": TextEditingController(),
    "address": TextEditingController(),
  };

  Map<String, bool> fillIsEmpty = {
    "fullName": false,
    "nickName": false,
    "phoneNumber": false,
    "gender": false,
    "dateOfBirth": false,
    "address": false,
  };

  List genderList = [
    "Male",
    'Female',
  ];
  Object gender = "Male";

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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
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
                ),
                24.horizontalSpace,
                Text(
                  'Fill in your bio',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Expanded(
              child: OnUnFocusTap(
                child: ListView(
                  padding: EdgeInsets.all(24),
                  children: [
                    Text(
                      "This data will be displayed in your account profile for security",
                      style: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    35.verticalSpace,
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          offset: Offset(12, 26),
                          color: Color(0xff5A6CEA).withOpacity(0.08),
                          blurRadius: 50,
                        ),
                      ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: RichText(
                              text: TextSpan(
                                  text: "Full Name",
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff2C3A4B).withOpacity(0.8),
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "*",
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 14.sp,
                                          color: Color(0xffDA1414)
                                              .withOpacity(0.8),
                                        ))
                                  ]),
                            ),
                          ),
                          8.verticalSpace,
                          TextFormField(
                            onChanged: (s) {
                              fillIsEmpty["fullName"] = false;
                              setState(() {});
                            },
                            controller: fillController["fullName"],
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff09101D),
                            ),
                            cursorColor: Color(0xff09101D),
                            decoration: InputDecoration(
                              hintText: "Full Name",
                              hintStyle: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xffDADEE3)),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          fillIsEmpty["fullName"] == true
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  height: 33.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Color(0xffEBEEF2),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.error,
                                        size: 18.sp,
                                        color: Color(0xff394452),
                                      ),
                                      4.horizontalSpace,
                                      Text(
                                        "Full Name is Empty",
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          offset: Offset(12, 26),
                          color: Color(0xff5A6CEA).withOpacity(0.08),
                          blurRadius: 50,
                        ),
                      ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: RichText(
                              text: TextSpan(
                                  text: "Nick Name",
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff2C3A4B).withOpacity(0.8),
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "*",
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 14.sp,
                                          color: Color(0xffDA1414)
                                              .withOpacity(0.8),
                                        ))
                                  ]),
                            ),
                          ),
                          8.verticalSpace,
                          TextFormField(
                            onChanged: (s) {
                              fillIsEmpty["nickName"] = false;
                              setState(() {});
                            },
                            controller: fillController["nickName"],
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff09101D),
                            ),
                            cursorColor: Color(0xff09101D),
                            decoration: InputDecoration(
                              hintText: "Nick Name",
                              hintStyle: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xffDADEE3)),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          fillIsEmpty["nickName"] == true
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  height: 33.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Color(0xffEBEEF2),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.error,
                                        size: 18.sp,
                                        color: Color(0xff394452),
                                      ),
                                      4.horizontalSpace,
                                      Text(
                                        "Nick Name is Empty",
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          offset: Offset(12, 26),
                          color: Color(0xff5A6CEA).withOpacity(0.08),
                          blurRadius: 50,
                        ),
                      ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: RichText(
                              text: TextSpan(
                                  text: "Phone Number",
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff2C3A4B).withOpacity(0.8),
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "*",
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 14.sp,
                                          color: Color(0xffDA1414)
                                              .withOpacity(0.8),
                                        ))
                                  ]),
                            ),
                          ),
                          8.verticalSpace,
                          TextFormField(
                            onChanged: (s) {
                              fillIsEmpty["phoneNumber"] = false;
                              setState(() {});
                            },
                            controller: fillController["phoneNumber"],
                            keyboardType: TextInputType.phone,
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff09101D),
                            ),
                            cursorColor: Color(0xff09101D),
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                              hintStyle: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xffDADEE3)),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1.2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1.2,
                                ),
                              ),
                            ),
                          ),
                          fillIsEmpty["phoneNumber"] == true
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  height: 33.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Color(0xffEBEEF2),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.error,
                                        size: 18.sp,
                                        color: Color(0xff394452),
                                      ),
                                      4.horizontalSpace,
                                      Text(
                                        "Phone Number is Empty",
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          offset: Offset(12, 26),
                          color: Color(0xff5A6CEA).withOpacity(0.08),
                          blurRadius: 50,
                        ),
                      ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: RichText(
                              text: TextSpan(
                                  text: "Gender",
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff2C3A4B).withOpacity(0.8),
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "*",
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 14.sp,
                                          color: Color(0xffDA1414)
                                              .withOpacity(0.8),
                                        ))
                                  ]),
                            ),
                          ),
                          8.verticalSpace,
                          DropdownButtonFormField(
                            value: gender,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                            ),
                            items: genderList
                                .map(
                                  (e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ),
                                )
                                .toList(),
                            onChanged: (newValue) {
                              gender = newValue ?? " ";
                              fillController["gender"]?.text =
                                  newValue.toString() ?? "";
                              fillIsEmpty["gender"] = false;
                              setState(() {});
                            },
                          ),
                          fillIsEmpty["gender"] == true
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  height: 33.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Color(0xffEBEEF2),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.error,
                                        size: 18.sp,
                                        color: Color(0xff394452),
                                      ),
                                      4.horizontalSpace,
                                      Text(
                                        "Gender is Empty",
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          offset: Offset(12, 26),
                          color: Color(0xff5A6CEA).withOpacity(0.08),
                          blurRadius: 50,
                        ),
                      ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: RichText(
                              text: TextSpan(
                                  text: "Date of Birth",
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff2C3A4B).withOpacity(0.8),
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "*",
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 14.sp,
                                          color: Color(0xffDA1414)
                                              .withOpacity(0.8),
                                        ))
                                  ]),
                            ),
                          ),
                          8.verticalSpace,
                          TextFormField(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(Duration(days: 365 * 5)),
                                lastDate:
                                    DateTime.now().add(Duration(days: 365 * 5)),
                              ).then(
                                (value) => fillController["dateOfBirth"]!.text =
                                    DateFormat("MMMM dd,yyyy")
                                        .format(value ?? DateTime.now()),
                              );
                              fillIsEmpty["dateOfBirth"] = false;
                              setState(() {});
                            },
                            onChanged: (s) {
                              fillIsEmpty["dateOfBirth"] = false;
                              setState(() {});
                            },
                            readOnly: true,
                            controller: fillController["dateOfBirth"],
                            keyboardType: TextInputType.phone,
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff09101D),
                            ),
                            cursorColor: Color(0xff09101D),
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.event_note,
                                color: Color(0xff858C94),
                              ),
                              hintText: "Date of Birth",
                              hintStyle: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xffDADEE3)),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1.2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1.2,
                                ),
                              ),
                            ),
                          ),
                          fillIsEmpty["dateOfBirth"] == true
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  height: 33.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Color(0xffEBEEF2),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.error,
                                        size: 18.sp,
                                        color: Color(0xff394452),
                                      ),
                                      4.horizontalSpace,
                                      Text(
                                        "Date Of Birth is Empty",
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          offset: Offset(12, 26),
                          color: Color(0xff5A6CEA).withOpacity(0.08),
                          blurRadius: 50,
                        ),
                      ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: RichText(
                              text: TextSpan(
                                  text: "Address",
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff2C3A4B).withOpacity(0.8),
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "*",
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 14.sp,
                                          color: Color(0xffDA1414)
                                              .withOpacity(0.8),
                                        ))
                                  ]),
                            ),
                          ),
                          8.verticalSpace,
                          TextFormField(
                            onChanged: (s) {
                              fillIsEmpty["address"] = false;
                              setState(() {});
                            },
                            controller: fillController["address"],
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff09101D),
                            ),
                            cursorColor: Color(0xff09101D),
                            decoration: InputDecoration(
                              hintText: "Address",
                              hintStyle: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xffDADEE3)),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Color(0xffEBEEF2),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          fillIsEmpty["address"] == true
                              ? Container(
                                  margin: EdgeInsets.only(top: 8),
                                  height: 33.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Color(0xffEBEEF2),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.error,
                                        size: 18.sp,
                                        color: Color(0xff394452),
                                      ),
                                      4.horizontalSpace,
                                      Text(
                                        "Address is Empty",
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    CustomButton(
                      onTap: () async {
                        if (!fillController.values
                            .map((e) => e.text.isNotEmpty)
                            .contains(false)) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => PaymentMethodPage()));
                          SharedPreferences _store =
                              await SharedPreferences.getInstance();
                          _store.setString(
                              "fullName", fillController['fullName']!.text);
                        }
                        setState(() {});
                      },
                      onChange: () {
                        if (fillController['fullName']!.text.isEmpty) {
                          fillIsEmpty['fullName'] = true;
                        } else if (fillController['nickName']!.text.isEmpty) {
                          fillIsEmpty['nickName'] = true;
                        } else if (fillController['phoneNumber']!
                            .text
                            .isEmpty) {
                          fillIsEmpty['phoneNumber'] = true;
                        } else if (fillController['gender']!.text.isEmpty) {
                          fillIsEmpty['gender'] = true;
                        } else if (fillController['dateOfBirth']!
                            .text
                            .isEmpty) {
                          fillIsEmpty['dateOfBirth'] = true;
                        } else if (fillController['address']!.text.isEmpty) {
                          fillIsEmpty['address'] = true;
                        }
                        setState(() {});
                      },
                      title: 'Next',
                      isActive: !fillController.values
                          .map((e) => e.text.isNotEmpty)
                          .contains(false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
