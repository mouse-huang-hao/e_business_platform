import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_business_platform/viewmodels/homemodels.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  final List<BannerItem> _bannerList;
  HomeSlider({Key? key,required this._bannerList}) : super(key: key);

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
 final CarouselSliderController _controller=CarouselSliderController();
 int _currentIndex = 0;
  Widget _getSlider(){
    return CarouselSlider(
      carouselController: _controller,
      items: List.generate(widget._bannerList.length, (index) =>Image.network(
        widget._bannerList[index].imgUrl,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,)
      ),
      options: CarouselOptions(
        autoPlay: true,
        onPageChanged: (index, reason) {
          _currentIndex=index;
          setState(() {           
          });
        },
      ),
    );
  }

  Widget _getSearch(){
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25)
          ),
          child: Text(
            "搜索",
            style: TextStyle(color: Colors.white,fontSize: 16),
            ),
        ),


        )
      );
  }

  Widget _getNavigation(){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget._bannerList.length, (index) {
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(microseconds: 300),
                height: 6,
                width: index == _currentIndex ? 35 : 20,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: index==_currentIndex?Colors.white:Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(3)
                ),
              )
            );
          }          
          )
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_getSlider(),_getSearch(),_getNavigation()      ],
    );
  }
}