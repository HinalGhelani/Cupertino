import 'package:flutter/cupertino.dart';
import 'package:outcaster_2/CartPage.dart';
import 'package:outcaster_2/HomePage.dart';
import 'package:outcaster_2/SearchPage.dart';

class GlobalVar{
  static late CupertinoTabController tabController = CupertinoTabController();

  static List stores = <Widget>[
    const HomePage(),
    const SearchPage(),
    const CartPage(),
  ];

  static List<Map> l = [
    {
      'id' : '1',
      'image' : "assets/images/img1.jpeg",
      'name' : "Vagabond sack",
      'category' : "fashion",
      'price' : "124",
      'i' : 1,
      'total' : 0,
      'qun' : 0,

    },
    {
      'id' : '2',
      'image' : "assets/images/img2.webp",
      'name' : "Stella sunglasses",
      'category' : "fashion",
      'price' : "43",
      'i' : 1,
      'total' : 0,
      'qun' : 0,
    },
    {
      'id' : '3',
      'image' : "assets/images/img3.webp",
      'name' : "Black Belt",
      'category' : "fashion",
      'price' : "36",
      'i' : 1,
      'total' : 0,
      'qun' : 0,
    },
    {
      'id' : '4',
      'image' : "assets/images/img4.jpeg",
      'name' : "Golden Chain",
      'category' : "jewellery",
      'price' : "68",
      'i' : 1,
      'total' : 0,
      'qun' : 0,
    },
    {
      'id' : '5',
      'image' : "assets/images/img5.webp",
      'name' : "Strut Earrings",
      'category' : "jewellery",
      'price' : "25",
      'i' : 1,
      'total' : 0,
      'qun' : 0,
    },
    {
      'id' : '6',
      'image' : "assets/images/img6.webp",
      'name' : "Leather Purse",
      'category' : "fashion",
      'price' : "59",
      'i' : 1,
      'total' : 0,
      'qun' : 0,
    },
    {
      'id' : '7',
      'image' : "assets/images/img7.jpeg",
      'name' : "Light Brown Purse",
      'category' : "fashion",
      'price' : "45",
      'i' : 1,
      'total' : 0,
      'qun' : 0,
    },
    {
      'id' : '8',
      'image' : "assets/images/img8.jpeg",
      'name' : "Men Watch",
      'category' : "fashion",
      'price' : "72",
      'i' : 1,
      'total' : 0,
      'qun' : 0,
    },
    {
      'id' : '9',
      'image' : "assets/images/img9.webp",
      'name' : "Sport Shoes",
      'category' : "fashion",
      'price' : "56",
      'i' : 1,
      'total' : 0,
      'qun' : 0,
    },
    {
      'id' : '10',
      'image' : "assets/images/img11.webp",
      'name' : "Wall Watch",
      'category' : "fashion",
      'price' : "120",
      'i' : 1,
      'total' : 0,
      'qun' : 0,
    },
  ];
  static List<Map> s = [];

  static List<Map<dynamic, dynamic>> cart = [];
  static int total = 0;
  static num totalPrice = 0;
  static num finalPrice = 0;
  static num shipping = 0;
  static num tax = 0;

  static String search = "";
  static String sItem = search;

}