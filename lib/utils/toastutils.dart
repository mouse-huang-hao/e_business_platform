

import 'package:flutter/material.dart';

class ToastUtils{
  static bool isShowing = false;
  static void showToast(BuildContext context,String? msg){
    if(isShowing){
      return;
    }
    isShowing = true;
    Future.delayed(Duration(seconds: 3),(){isShowing=false;});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 180,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(40)
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        content: Text(msg??"加载成功",textAlign: TextAlign.center),
      )
    );
  }
}