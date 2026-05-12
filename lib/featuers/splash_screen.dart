import 'package:flutter/material.dart';
import 'package:wateen/core/routes/app_routes.dart';
import 'package:wateen/core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),
   (){
    Navigator.of(context).pushReplacementNamed(AppRoutes.main);
   });
  }
  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark
      ? AppColors.black
      :AppColors.white,
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: isDark
            // ? AppColors.black
            // :Colors.white,
            image: DecorationImage(
              image:isDark
              ? AssetImage("assets/images/dark_wateen.jpeg")
              : AssetImage("assets/images/blue_wateen.jpeg",),
              fit: BoxFit.cover
              )
          ),
        ),
      )
    );
  }
}