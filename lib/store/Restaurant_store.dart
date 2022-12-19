// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:fodee/Model/RestaurantModel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class RestaurantStore {
//
//    void setRestaurant(List<RestaurantModel> restaurants) async {
//     SharedPreferences local = await SharedPreferences.getInstance();
//     local.setStringList("restaurants", [jsonEncode(restaurants)]);
//   }
//   Future<List<RestaurantModel>> getRestaurant() async{
//     SharedPreferences local = await SharedPreferences.getInstance();
//     List<String>? restaurantLocal =local.getStringList("restaurants") ;
//     List<RestaurantModel> newRestaurant = [RestaurantModel.fromJson(jsonDecode(restaurantLocal))];
//     return newRestaurant;
//   }
//
//   fillRestaurant(){
//     List<RestaurantModel> listOfRestaurant = [
//       RestaurantModel(
//         logo: "assets/svg/Restaurant/Lovy Food.svg",
//         title: "Lovy Food",
//         time: 10,
//         logoColor: Color(0xffFF5272),
//       ),
//       RestaurantModel(
//         logo: "assets/svg/Restaurant/Cloudy Resto.svg",
//         title: "Cloudy Resto",
//         time: 13,
//         logoColor: Color(0xffFFCC45),
//       ),
//       RestaurantModel(
//         logo: "assets/svg/Restaurant/Circlo Resto.svg",
//         title: "Circlo Resto",
//         time: 11,
//         logoColor: Color(0xff4283FF),
//       ),
//       RestaurantModel(
//         logo: "assets/svg/Restaurant/Haty Food.svg",
//         title: "Haty Food",
//         time: 16,
//         logoColor: Color(0xff46D57D),
//       ),
//       RestaurantModel(
//         logo: "assets/svg/Restaurant/Hearthy Resto.svg",
//         title: "Hearthy Resto",
//         time: 18,
//         logoColor: Color(0xffFFC531),
//       ),
//       RestaurantModel(
//         logo: "assets/svg/Restaurant/Recto Food.svg",
//         title: "Recto Food",
//         time: 15,
//         logoColor: Color(0xffFF5272),
//       ),
//     ];
//      setRestaurant(listOfRestaurant);
//   }
//
// }
//
//
