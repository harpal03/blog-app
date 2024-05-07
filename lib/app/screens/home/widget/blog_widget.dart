import 'package:blog_app/app/const/colors.dart';
import 'package:blog_app/app/models/blog_model.dart';
import 'package:blog_app/app/screens/home/widget/read_more_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({super.key, required this.blog});
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      decoration: BoxDecoration(
          color: CommonColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: CommonColors.primaryColor.withOpacity(0.25),
                blurRadius: 5,
                spreadRadius: 0.05)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            blog.title ?? '',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: CommonColors.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: 150,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              imageUrl: blog.imageUrl ?? '',
              placeholder: (context, url) => SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
                child: Shimmer.fromColors(
                    baseColor: CommonColors.lightGreyColor,
                    highlightColor: CommonColors.grey300Color,
                    child: Container(
                      color: CommonColors.whiteColor,
                      width: MediaQuery.of(context).size.width,
                      height: 150.0,
                    )),
              ),
              errorWidget: (context, url, error) => Container(
                  color: CommonColors.lightGreyColor,
                  child: Icon(
                    Icons.error_outline,
                    size: 30,
                    color: CommonColors.greyColor,
                  )),
            ),
          ),
          const SizedBox(height: 10),
          ExpandableWidget(content: blog.summary)
        ],
      ),
    );
  }
}
