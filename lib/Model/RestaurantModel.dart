
import 'package:flutter/material.dart';

class RestaurantModel {
  String logo;
  String title;
  int time;
  Color logoColor;

  RestaurantModel({
    required this.logo,
    required this.title,
    required this.time,
    required this.logoColor,
  });

  factory RestaurantModel.fromJson(Map data){
    return RestaurantModel(
      logo: data['logo'],
      title: data['title'],
      time: data['time'],
      logoColor: data['logoColor'],);
  }

  Map<String,dynamic> toJson(){
    return{
      'logo':logo,
      'title':title,
      'time':time,
      'logoColor':logoColor,
    };
  }
}
