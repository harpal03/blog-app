import 'package:blog_app/app/models/blog_model.dart';
import 'package:blog_app/app/provider/blog_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirebaseService {
  Future<void> getAllBlogs(BuildContext context) async {
    try {
      QuerySnapshot<Map<String, dynamic>> getBlogs =
          await FirebaseFirestore.instance.collection('blogs').get();
      List<Blog> blogList = getBlogs.docs.map((e) {
        return Blog.fromjson(e);
      }).toList();
      Provider.of<BlogProvider>(context, listen: false).setBlogList(blogList);
    } catch (e) {
      print("Error $e");
    }
  }
}
