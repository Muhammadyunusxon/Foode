import 'package:flutter/material.dart';
import 'package:fodee/pages/Auth/OnBoardingPage.dart';
import 'package:fodee/pages/Home/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../GeneralPage.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState(){
      Future.delayed(Duration(seconds: 5),() async {
        SharedPreferences _local =await SharedPreferences.getInstance();
        String email = _local.getString("email") ?? "";
        if(email.isNotEmpty){
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => GeneralPage() ));
        }else{
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => OnBoardingPage() ));
        }
      }
      );

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("assets/image/Light_Splash Screen.png",fit: BoxFit.cover ,),
      ),
    );
  }
}
