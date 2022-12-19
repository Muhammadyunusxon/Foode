import 'package:flutter/material.dart';
import 'package:fodee/pages/Auth/OnBoardingPage.dart';
import 'package:fodee/pages/Home/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/UserModel.dart';
import '../store/local_store.dart';
import 'GeneralPage.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState(){
      Future.delayed(Duration(seconds: 5),() async {
        LocalStore local =LocalStore();
        UserModel user = await local.getUser();

        if(user.email.isNotEmpty){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => GeneralPage()),(s){
            return false;
          });
        }else{
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => OnBoardingPage() ),(s){
            return false;
          });
        }
      }
      );

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () async{
          LocalStore local =LocalStore();
          UserModel user = await local.getUser();

          if(user.email.isNotEmpty){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => GeneralPage()),(s){
              return false;
            });
          }else{
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => OnBoardingPage() ),(s){
              return false;
            });
          }
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/image/Light_Splash Screen.png",fit: BoxFit.cover ,),
        ),
      ),
    );
  }
}
