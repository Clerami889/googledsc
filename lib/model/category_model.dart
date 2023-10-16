import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconname;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconname,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: "Bali",
        iconname: "assets/cate/bali.jpg",
        boxColor: const Color(0xffDFCCFB),
      ),
    );

    categories.add(
      CategoryModel(
        name: "Jawa",
        iconname: "assets/cate/jawa.jpg",
        boxColor: const Color(0xffD2E0FB),
      ),
    );

    categories.add(
      CategoryModel(
        name: "Sumatra",
        iconname: "assets/cate/sumatra.jpg",
        boxColor: const Color(0xffD2E0FB),
      ),
    );

    categories.add(
      CategoryModel(
        name: "Kalimantan",
        iconname: "assets/cate/kalimantan.jpg",
        boxColor: const Color(0xffACBCFF),
      ),
    );

    return categories;
  }
}
