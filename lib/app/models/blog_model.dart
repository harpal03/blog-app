import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  final String? title;
  final String? summary;
  // final String? controlUnitName;
  // final String? probeName;
  final String? imageUrl;
  Blog({
    required this.title,
    required this.summary,
    // required this.controlUnitName,
    // required this.probeName,
    required this.imageUrl,
  });

  factory Blog.fromjson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    final dataJson = json.data();
    return Blog(
      title: dataJson['title'],
      summary: dataJson['summary'],
      // controlUnitName: dataJson['controlUnit'],
      // probeName: dataJson['probe'],
      imageUrl: dataJson['image_url'],
    );
  }
}
