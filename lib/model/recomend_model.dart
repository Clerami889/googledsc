import 'package:flutter/material.dart';

class Recomend {
  String nama;
  String iconName;
  String price;
  String rate;
  String lokasi;
  bool selected;
  Color boxcolor;

  Recomend(
      {required this.nama,
      required this.iconName,
      required this.price,
      required this.rate,
      required this.lokasi,
      required this.selected,
      required this.boxcolor});

  static List<Recomend> getRecomend() {
    List<Recomend> recomend = [];

    recomend.add(Recomend(
        nama: "Pulau Komodo",
        iconName: "assets/rekomen/komodo.jpg",
        price: "12jt",
        rate: "4.2/5",
        lokasi: "1500KM",
        selected: true,
        boxcolor: Color(0xffFFF2CC)));

    recomend.add(Recomend(
        nama: "Pink Beach",
        iconName: "assets/rekomen/pinkbeach.jpg",
        price: "15jt",
        rate: "4.8/5",
        lokasi: "1400KM",
        selected: false,
        boxcolor: Color(0xffE9FFC2)));

    recomend.add(Recomend(
        nama: "Raja Ampat",
        iconName: "assets/rekomen/raja4.jpg",
        price: "20jt",
        rate: "5/5",
        lokasi: "2800KM",
        selected: false,
        boxcolor: Color(0xffD2E0FB)));

    return recomend;
  }
}
