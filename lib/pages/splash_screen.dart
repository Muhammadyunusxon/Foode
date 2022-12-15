import 'package:flutter/material.dart';
import 'package:fodee/pages/OnBoardingPage.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => OnBoardingPage() ));
    });
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
