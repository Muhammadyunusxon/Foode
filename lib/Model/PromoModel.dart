import 'package:flutter/material.dart';

class PromoModel {
  String image;
  String title;
  List<Color> backgroundColor;
  Color buyBackground;

  PromoModel({
    required this.image,
    required this.title,
    required this.backgroundColor,
    required this.buyBackground,
  });
}
