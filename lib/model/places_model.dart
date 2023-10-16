import 'package:flutter/material.dart';

class Places {
  String nama;
  String iconName;
  String price;
  String rate;
  String lokasi;
  bool selected;
  Color boxcolor;

  Places(
      {required this.nama,
      required this.iconName,
      required this.price,
      required this.rate,
      required this.lokasi,
      required this.selected,
      required this.boxcolor});

  static List<Places> getPlaces() {
    List<Places> place = [];

    place.add(Places(
        nama: "Nusa Penida",
        iconName: "assets/place/nusapenida.jpg",
        price: "12jt",
        rate: "4.8/5",
        lokasi: "2300KM",
        selected: true,
        boxcolor: Color(0xffFFF2CC)));

    place.add(Places(
        nama: "Bromo",
        iconName: "assets/place/bromo.jpg",
        price: "7jt",
        rate: "4.5/5",
        lokasi: "1400KM",
        selected: false,
        boxcolor: Color(0xffE9FFC2)));

    place.add(Places(
        nama: "Danau Toba",
        iconName: "assets/place/toba.jpg",
        price: "5jt",
        rate: "4.3/5",
        lokasi: "400KM",
        selected: false,
        boxcolor: Color(0xffD2E0FB)));

    return place;
  }
}
