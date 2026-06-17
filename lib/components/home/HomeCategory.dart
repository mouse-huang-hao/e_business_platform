

import 'package:flutter/material.dart';

class HomeCategory extends StatefulWidget {
  HomeCategory({Key? key}) : super(key: key);

  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(itemBuilder: (context, index) {
        return Container(width: 80,height: 100,alignment: Alignment.center,margin: EdgeInsets.symmetric(horizontal: 10),);
      },itemCount: 9,scrollDirection: Axis.horizontal,)
    );
  }
}