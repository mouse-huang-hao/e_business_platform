

import 'package:e_business_platform/viewmodels/homemodels.dart';
import 'package:flutter/material.dart';

class HomeCategory extends StatefulWidget {
  HomeCategory({Key? key,required this.categoryList}) : super(key: key);
  final List<CategoryItem> categoryList;

  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(itemBuilder: (context, index) {
        final category=widget.categoryList[index];
        return Container(
          width: 80,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 231, 232, 234),
            borderRadius: BorderRadius.circular(40),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(category.picture,width: 40,height: 40,),
              Text(category.name,style: TextStyle(color: Colors.black))
            ],
          ),
          );
      },itemCount: widget.categoryList.length,
        scrollDirection: Axis.horizontal)
    );
  }
}