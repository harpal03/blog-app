import 'package:blog_app/app/const/colors.dart';
import 'package:blog_app/app/provider/blog_provider.dart';
import 'package:blog_app/app/screens/home/widget/blog_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.whiteColor,
      appBar: AppBar(
        title: const Text(
          'Blogs',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 22.0,
            color: Colors.black,
          ),
        ),
        elevation: 20,
      ),
      body: Consumer<BlogProvider>(builder: (context, blogProvider, child) {
        return ListView.builder(
            itemCount: blogProvider.blogList.length,
            itemBuilder: (context, index) {
              return BlogWidget(
                blog: blogProvider.blogList[index],
              );
            });
      }),
    );
  }
}
