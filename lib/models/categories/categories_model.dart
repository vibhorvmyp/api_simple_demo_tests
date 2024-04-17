// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class Categories {
//   final String title;

//   Categories(this.title);

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'title': title,
//     };
//   }

//   factory Categories.fromMap(Map<String, dynamic> map) {
//     return Categories(
//       map['title'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Categories.fromJson(String source) =>
//       Categories.fromMap(json.decode(source) as Map<String, dynamic>);
// }

// Categories model
import 'dart:convert';

class Categories {
  final String title;

  Categories(this.title);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
    };
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) {
    final map = json.decode(source);
    return Categories.fromMap(map);
  }

  // New factory constructor
  factory Categories.fromString(String title) {
    return Categories(title);
  }
}
