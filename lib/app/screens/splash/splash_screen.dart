import 'package:blog_app/app/const/colors.dart';
import 'package:blog_app/app/screens/home/home_screen.dart';
import 'package:blog_app/app/services/firebase_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseService().getAllBlogs(context).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.whiteColor,
      body: const Center(
        child: Text(
          'Blog',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 22.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
