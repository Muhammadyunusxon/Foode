import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fodee/Components/CustomButton.dart';
import 'package:fodee/Components/OnFocusTap.dart';
import 'package:fodee/pages/Home/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../GeneralPage.dart';
import 'SignUpPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool emailEmpty = false;
  bool passwordEmpty = false;
  bool _isHidden = false;
  bool _isClick = false;
  bool _isChecked = false;
  bool emailIncorrect = false;
  bool passwordIncorrect = false;

  String email = "admin";
  String password = "admin";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          children: [
            OnUnFocusTap(
              child: Column(
                children: [
                  Container(
                    height: 192.h,
                    width: 199.w,
                    child: Image.asset("assets/image/Logo_Group.png"),
                  ),
                  28.verticalSpace,
                  Text(
                    "Sign in to your account",
                    style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w600,
                      fontSize: 23.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  32.verticalSpace,
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
                                text: "Email",
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
                                        color: Color(0xffDA1414).withOpacity(0.8),
                                      ))
                                ]),
                          ),
                        ),
                        8.verticalSpace,
                        TextFormField(
                          onChanged: (s) {
                            emailEmpty = false;
                            emailIncorrect = false;
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              _isClick = true;
                            } else {
                              _isClick = false;
                            }
                            setState(() {});
                          },
                          controller: emailController,
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff09101D),
                          ),
                          cursorColor: Color(0xff09101D),
                          decoration: InputDecoration(
                            hintText: "Email or Phone Number",
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
                        emailEmpty
                            ? Container(
                          margin: EdgeInsets.only(
                            top: 8,
                          ),
                          height: 33.h,
                          padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
                                "Email is Empty",
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        )
                            : emailIncorrect
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
                                "Email incorrect",
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
                                text: "Password",
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
                                        color: Color(0xffDA1414).withOpacity(0.8),
                                      ))
                                ]),
                          ),
                        ),
                        8.verticalSpace,
                        TextFormField(
                          onChanged: (s) {
                            passwordEmpty = false;
                            passwordIncorrect = false;
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              _isClick = true;
                            } else {
                              _isClick = false;
                            }
                            setState(() {});
                          },
                          obscureText: _isHidden,
                          obscuringCharacter: "*",
                          controller: passwordController,
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff09101D),
                          ),
                          cursorColor: Color(0xff09101D),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _isHidden = !_isHidden;
                                setState(() {});
                              },
                              child: Icon(
                                !_isHidden ? Icons.visibility : Icons.visibility_off,
                                color: Color(0xff858C94),
                              ),
                            ),
                            hintText: "Password",
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
                        passwordEmpty
                            ? Container(
                          margin: EdgeInsets.only(
                            top: 8,
                          ),
                          height: 33.h,
                          padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
                                "Password is Empty",
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        )
                            : passwordIncorrect
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
                                "Password Incorrect",
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
                  12.verticalSpace,
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _isChecked = !_isChecked;
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            _isClick = true;
                          } else {
                            _isClick = false;
                          }
                          setState(() {});
                        },
                        icon: Icon(
                          _isChecked
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          size: 20,
                          color: Color(0xffF43F5E),
                        ),
                      ),
                      Text(
                        "Remember me",
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _isChecked ? Color(0xff09101D) : Color(0xff2C3A4B),
                        ),
                      )
                    ],
                  ),
                  12.verticalSpace,
                ],
              ),
            ),
            CustomButton(
              onTap: () {
                if (_isClick &&
                    password == passwordController.text &&
                    email == emailController.text) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>GeneralPage()));
                }
                setState(() {
                });
              },
              onChange: (){
                if (emailController.text.isEmpty) {
                  emailEmpty = true;
                } else if (passwordController.text.isEmpty) {
                  passwordEmpty = true;
                } else if (emailController.text != email) {
                  emailIncorrect = true;
                } else if (password != passwordController.text) {
                  passwordIncorrect = true;
                } else {
                  _isClick = false;
                  setState(() {});
                }
                setState(() {
                });
              },
              title: 'Sign In',isActive: _isClick,
            ),
            20.verticalSpace,
            Text(
              "Forgot the password?",
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Color(0xffF43F5E),
              ),
              textAlign: TextAlign.center,
            ),
            32.verticalSpace,
            Text(
              "or continue with",
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Color(0xff09101D),
              ),
              textAlign: TextAlign.center,
            ),
            24.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 178.w,
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffF4F6F9),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(12, 26),
                        blurRadius: 50,
                        color: Color(0xff5A6CEA14).withOpacity(0.08),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        offset: Offset(12, 26),
                        blurRadius: 50,
                        color: Color(0xff5A6CEA).withOpacity(0.08),
                      )
                    ]),
                    child: Row(
                      children: [
                        10.horizontalSpace,
                        SizedBox(
                          height: 25.h,
                          width: 25.w,
                          child:
                              Image.asset("assets/image/social/facebook.png"),
                        ),
                        12.horizontalSpace,
                        Text(
                          "Facebook",
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Color(0xff09051C),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 178.w,
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffF4F6F9),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(12, 26),
                        blurRadius: 50,
                        color: Color(0xff5A6CEA14).withOpacity(0.08),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        offset: Offset(12, 26),
                        blurRadius: 50,
                        color: Color(0xff5A6CEA).withOpacity(0.08),
                      )
                    ]),
                    child: Row(
                      children: [
                        10.horizontalSpace,
                        SizedBox(
                          height: 25.h,
                          width: 25.w,
                          child: Image.asset("assets/image/social/google.png"),
                        ),
                        12.horizontalSpace,
                        Text(
                          "Google",
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Color(0xff09051C),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            32.verticalSpace,
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SignUpPage()));
              },
              child: RichText(
                text: TextSpan(
                    text: "Don’t have an account?   ",
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff858C94),
                    ),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffF43F5E),
                        ),
                      ),
                    ]),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
