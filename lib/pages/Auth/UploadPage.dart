import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fodee/Components/CustomAppBar.dart';
import 'package:fodee/Components/CustomButton.dart';
import 'package:fodee/pages/Home/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../Components/Congrats.dart';
import '../GeneralPage.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final ImagePicker _image = ImagePicker();
  String imagePath = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "Upload your photo",
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      "This data will be displayed in your account profile for security",
                      style: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    24.verticalSpace,
                    imagePath.isEmpty
                        ? Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            _image
                                .pickImage(source: ImageSource.camera)
                                .then((value) async {
                              if (value != null) {
                                CroppedFile? cropperImage =
                                await ImageCropper().cropImage(
                                    sourcePath: value.path);
                                imagePath = cropperImage?.path ?? "";
                                setState(() {});
                              }
                            });
                            setState(() {});
                          },
                          child: Container(
                            height: 160.h,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 23.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color(0xffEBEEF2),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(12, 26),
                                  blurRadius: 50,
                                  color:
                                  Color(0xff5A6CEA).withOpacity(0.08),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 80.h,
                                    width: 80.h,
                                    padding: EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffF43F5E)
                                          .withOpacity(0.1),
                                    ),
                                    child: Image.asset(
                                        "assets/image/camera alt.png")),
                                Text(
                                  "Take photo",
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff09101D),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        24.verticalSpace,
                        GestureDetector(
                          onTap: () async {
                            _image
                                .pickImage(source: ImageSource.gallery)
                                .then((value) async {
                              if (value != null) {
                                CroppedFile? cropperImage =
                                await ImageCropper().cropImage(
                                    sourcePath: value.path);
                                imagePath = cropperImage?.path ?? "";
                                setState(() {});
                              }
                            });
                            setState(() {});
                          },
                          child: Container(
                            height: 160.h,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 23.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color(0xffEBEEF2),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(12, 26),
                                  blurRadius: 50,
                                  color:
                                  Color(0xff5A6CEA).withOpacity(0.08),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 80.h,
                                    width: 80.h,
                                    padding: EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffF43F5E)
                                          .withOpacity(0.1),
                                    ),
                                    child: Image.asset(
                                        "assets/image/folder.png")),
                                Text(
                                  "From gallery",
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff09101D),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                        : SizedBox.shrink(),
                    if (imagePath.isEmpty)
                      SizedBox.shrink()
                    else
                      Stack(
                        children: [
                          Container(
                            height: 250.r,
                            width: 250.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: FileImage(
                                  File(imagePath),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        child: Container(
                                          padding: EdgeInsets.all(24),
                                          width: 180.w,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      _image
                                                          .pickImage(
                                                          source:
                                                          ImageSource
                                                              .camera)
                                                          .then((value) async {
                                                        if (value != null) {
                                                          CroppedFile?
                                                          _cropperImage =
                                                          await ImageCropper()
                                                              .cropImage(
                                                              sourcePath:
                                                              value
                                                                  .path);
                                                          if (_cropperImage !=
                                                              null) {
                                                            imagePath =
                                                                _cropperImage
                                                                    .path;
                                                            setState(() {});
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                        height: 65.r,
                                                        width: 65.r,
                                                        padding:
                                                        EdgeInsets.all(14),
                                                        decoration:
                                                        BoxDecoration(
                                                          shape:
                                                          BoxShape.circle,
                                                          color: Color(
                                                              0xffF43F5E)
                                                              .withOpacity(0.1),
                                                        ),
                                                        child: Image.asset(
                                                            "assets/image/camera alt.png")),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      _image
                                                          .pickImage(
                                                          source:
                                                          ImageSource
                                                              .gallery)
                                                          .then((value) async {
                                                        if (value != null) {
                                                          CroppedFile?
                                                          _cropperImage =
                                                          await ImageCropper()
                                                              .cropImage(
                                                              sourcePath:
                                                              value
                                                                  .path);
                                                          if (_cropperImage !=
                                                              null) {
                                                            imagePath =
                                                                _cropperImage
                                                                    .path;
                                                            setState(() {});
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                        height: 65.r,
                                                        width: 65.r,
                                                        padding:
                                                        EdgeInsets.all(14),
                                                        decoration:
                                                        BoxDecoration(
                                                          shape:
                                                          BoxShape.circle,
                                                          color: Color(
                                                              0xffF43F5E)
                                                              .withOpacity(0.1),
                                                        ),
                                                        child: Image.asset(
                                                            "assets/image/folder.png")),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      imagePath = "";
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                        height: 65.r,
                                                        width: 65.r,
                                                        padding:
                                                        EdgeInsets.all(14),
                                                        decoration:
                                                        BoxDecoration(
                                                          shape:
                                                          BoxShape.circle,
                                                          color: Color(
                                                              0xffF43F5E)
                                                              .withOpacity(0.1),
                                                        ),
                                                        child: Icon(
                                                          Icons.delete,
                                                          color:
                                                          Color(0xffF43F5E),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              32.verticalSpace,
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 18),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                    color: Color(0xffF43F5E)
                                                        .withOpacity(0.1),
                                                  ),
                                                  child: Text(
                                                    "Cencel",
                                                    style: GoogleFonts
                                                        .sourceSansPro(
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Color(0xffF43F5E),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(8.r),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    Spacer(),
                    CustomButton(
                        title: "Next",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) =>
                                  CongratsScreen(

                                    buttonTitle: 'Go homepage',
                                    description: 'Your profile is ready to use', NavigatorPage: GeneralPage(),
                                  )));
                        },
                        isActive: imagePath.isNotEmpty),
                    24.verticalSpace,
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
