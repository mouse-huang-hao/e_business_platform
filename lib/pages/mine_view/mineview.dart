import 'package:e_business_platform/api/mineapi.dart';
import 'package:e_business_platform/components/home/HomeGoodsList.dart';
import 'package:e_business_platform/components/mine/MineList.dart';
import 'package:e_business_platform/stores/UserController.dart';
import 'package:e_business_platform/viewmodels/homemodels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MineView extends StatefulWidget {
  MineView({Key? key}) : super(key: key);

  @override
  _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  final Usercontroller _usercontroller = Get.put(Usercontroller());



  Widget _buildHeader(){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Color(0xFFFFF2E8),
            Color(0xFFFDF6F1),
          ]
        ),
      ),
      padding:  const EdgeInsets.only(left: 20,right: 40,top: 80,bottom: 20),
      child: Row(
        children: [
          Obx((){
            return CircleAvatar(
              radius: 26,
              backgroundImage: 
              _usercontroller.user.value.avatar.isNotEmpty?
              NetworkImage(_usercontroller.user.value.avatar):
              AssetImage("lib/assets/icon_login.jpeg"),
              backgroundColor: Colors.white,
            );
          }),          
          const SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx((){
                  return  GestureDetector(
                    onTap: (){
                      if(_usercontroller.user.value.id.isEmpty){
                        Navigator.pushNamed(context, "/login");
                      }  
                    },
                    child:  Text(_usercontroller.user.value.id.isNotEmpty?_usercontroller.user.value.account:"立即登录",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  );      
                })         
              ],
              )
          )
        ],
      ),
    );
  }
  Widget _buildVIP(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 239, 197, 153),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
        ),
        child: Row(
          children: [
            Image.asset("lib/assets/icon_vip.png",width: 30,height: 30,),
            SizedBox(width: 10,),
            Expanded(child: Text("升级商城会员，尊享无限免邮",style: TextStyle(fontSize: 14,color: Color.fromRGBO(128, 44, 26, 1)),),),
            TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(126,43,26,1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text("立即开通",style: TextStyle(fontSize: 12)),),
              
          ],
        ),
      ),
      );
  }
  Widget _buildQuickAtions(){
    Widget _getQuickAtionsItems(String pic,String label){
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(pic,width: 30,height: 30,fit: BoxFit.cover,),
          const SizedBox(height: 6,),
          Text(label,style: const TextStyle(fontSize: 12),)
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _getQuickAtionsItems("lib/assets/icon_my_favorites.jpeg","我的收藏"),
            _getQuickAtionsItems("lib/assets/icon_my_footprint.jpeg","我的足迹"),
            _getQuickAtionsItems("lib/assets/icon_CS.jpeg","我的客服"),
          ],
        ),
      ),
    );
  }

  Widget _buildOrders(){
    Widget _getOrdersItems(String pic,String label){
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(pic,width: 30,height: 30,fit: BoxFit.cover,),
          const SizedBox(height: 6,),
          Text(label,style: const TextStyle(fontSize: 12,color: Colors.black),)
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("我的订单",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _getOrdersItems("lib/assets/icon_orders.jpeg","全部订单"),
                    _getOrdersItems("lib/assets/icon_waiting_for_paying.jpeg","待付款"),
                    _getOrdersItems("lib/assets/icon_waiting_for_delivering.jpeg","待发货"),
                    _getOrdersItems("lib/assets/icon_waiting_for_receiving.jpeg","待收货"),
                    _getOrdersItems("lib/assets/icon_evaluation.jpeg","待评价"),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }


  List<Good> _list = [];
  Map<String,dynamic> _params = {"page":1,"pageSize":10};


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getGuessList();
    _registerScrollListener();
  }
  void _registerScrollListener(){
    _scrollController.addListener((){
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent){
        _params["page"]++;
        _getGuessList();
      }
    });
  }
  bool _isLoading = false;
  bool _isThereaNextPage = true;


  void _getGuessList() async{
    if(_isLoading||!_isThereaNextPage)return;
    _isLoading = true;
    final res = await getGuessAPI(_params);
    _isLoading = false;
    _list.addAll(res.items);

    setState(() { });
    if(_params["page"] >= res.pages){
      _isThereaNextPage = false;
      return;
    }
    _params["page"]++;
  }
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
       slivers: [
        SliverToBoxAdapter(
          child: _buildHeader(),
        ),
        SliverToBoxAdapter(child: _buildVIP(),),
        SliverToBoxAdapter(child: _buildQuickAtions(),),
        SliverToBoxAdapter(child: _buildOrders(),),
        SliverPersistentHeader(delegate: MineList(),pinned: true,),
        HomeGoodsList(goodsList: _list)
       ],
    );
  }
}