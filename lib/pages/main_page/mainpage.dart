import 'package:e_business_platform/pages/cart_view/cartview.dart';
import 'package:e_business_platform/pages/classification_view/classificationview.dart';
import 'package:e_business_platform/pages/home_view/homeview.dart';
import 'package:e_business_platform/pages/mine_view/mineview.dart';
import 'package:flutter/material.dart';


class Mainpage extends StatefulWidget {
  Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _currentIndex = 0;
  final List<Map<String,String>> _navigatorList = [
    {
      "icon": "lib/assets/home_normal.png",
      "active_icon": "lib/assets/home_active.png",
      "text": "主页"
      },
        {
      "icon": "lib/assets/classification_normal.png",
      "active_icon": "lib/assets/classification_active.png",
      "text": "分类"
      },
        {
      "icon": "lib/assets/cart_normal.png",
      "active_icon": "lib/assets/cart_active.png",
      "text": "购物车"
      },
        {
      "icon": "lib/assets/mine_normal.png",
      "active_icon": "lib/assets/mine_active.png",
      "text": "我的"
      }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _getIndexedStack(),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:_getNavigationBarItems(),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (int index) {
          _currentIndex=index;
          setState(() {
          });
        },
        )
    );
  }


  List<BottomNavigationBarItem> _getNavigationBarItems(){
  return List.generate(_navigatorList.length, (int index){
    return BottomNavigationBarItem(
      icon: Image.asset(_navigatorList[index]["icon"]!,width: 50,height: 50),
      activeIcon: Image.asset(_navigatorList[index]["active_icon"]!,width: 50,height: 50),
      label: _navigatorList[index]["text"],
    );
  });
 }



}

 List<Widget> _getIndexedStack(){
  return [HomeView(),ClassificationView(),CartView(),MineView()];
 }