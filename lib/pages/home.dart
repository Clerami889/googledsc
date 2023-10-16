// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

import 'package:project/model/category_model.dart';
import 'package:project/model/places_model.dart';
import 'package:project/model/recomend_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<CategoryModel> categories = [];
List<Places> place = [];
List<Recomend> recomend = [];

void _getInfo() {
  categories = CategoryModel.getCategories();
  place = Places.getPlaces();
  recomend = Recomend.getRecomend();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    _getInfo();
    return Scaffold(
      appBar: appbars(),
      body: ListView(
        children: [
          searchbar(),
          SizedBox(height: 40),
          Kategori(),
          SizedBox(height: 40),
          Popular(),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Recommended",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: recomend.length,
                separatorBuilder: (context, index) => SizedBox(height: 25),
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            recomend[index].iconName,
                            width: 120,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recomend[index].nama,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                recomend[index].price +
                                    " | " +
                                    recomend[index].rate +
                                    " | " +
                                    recomend[index].lokasi,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_circle_right,
                              size: 35,
                            ),
                          )
                        ]),
                    height: 115,
                    decoration: BoxDecoration(
                        color: recomend[index].selected
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: recomend[index].selected
                            ? [
                                BoxShadow(
                                  color: Color(0xff1d1617).withOpacity(0.2),
                                  blurRadius: 40,
                                  spreadRadius: 0,
                                ),
                              ]
                            : []),
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Column Popular() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Popular Location",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 250,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  width: 220,
                  decoration: BoxDecoration(
                    color: place[index].boxcolor.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          place[index].iconName,
                          height: 140,
                        ),
                      ),
                      Text(
                        place[index].nama,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      Text(
                        place[index].price +
                            " | " +
                            place[index].rate +
                            " | " +
                            place[index].lokasi,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.4)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        height: 35,
                        width: 105,
                        child: ButtonTheme(
                          child: Center(
                              child: Text(
                            "More",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          gradient: LinearGradient(
                              colors: [Color(0xff8EACCD), Color(0xffD0BFFF)]),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20, right: 20),
              itemCount: place.length),
        )
      ],
    );
  }

  Column Kategori() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Category",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          categories[index].iconname,
                          scale: 1,
                        ),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 14),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container searchbar() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 40,
              spreadRadius: 0),
        ],
      ),
      child: Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.search_sharp),
            suffixIcon: Icon(Icons.filter_list),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  AppBar appbars() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "TravelER",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900),
      ),
      centerTitle: true,
      elevation: 0.0,
      leading: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: Colors.black,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Icon(
            Icons.more_horiz,
            size: 20,
            color: Colors.black,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        )
      ],
    );
  }
}
