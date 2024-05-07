import 'package:blog_app/app/models/blog_model.dart';
import 'package:flutter/material.dart';

class BlogProvider extends ChangeNotifier {
  List<Blog> _blogList = [];
  List<Blog> get blogList => _blogList;

  setBlogList(List<Blog> allBlogs) {
    _blogList = allBlogs;
    notifyListeners();
  }
}
