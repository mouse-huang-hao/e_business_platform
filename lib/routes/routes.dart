import 'package:e_business_platform/pages/login_page/loginpage.dart';
import 'package:e_business_platform/pages/main_page/mainpage.dart';
import 'package:flutter/material.dart';

Widget getRootWidget(){
  return MaterialApp(
    initialRoute: "/",
    routes:getRootRoutes()
  );
}



Map<String, Widget Function(BuildContext)>getRootRoutes(){
  return{
    "/":(context) =>Mainpage() ,
    "/login":(context) => LoginPage()
  };
}