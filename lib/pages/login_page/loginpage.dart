import 'package:dio/dio.dart';
import 'package:e_business_platform/api/user.dart';
import 'package:e_business_platform/stores/UserController.dart';
import 'package:e_business_platform/utils/toastutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _accountController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  final Usercontroller _usercontroller = Get.find();

  Widget _buildAccountTextField (){
    return TextFormField(
      validator: (value){
        if(value == null|| value.isEmpty){
          return "手机号不能为空";
        }
        if(! RegExp(r"^1[3-9]\d{9}$").hasMatch(value)){
          return "手机号格式不正确";
        }
        return null;
      },
      controller: _accountController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        hintText: "请输入账号",
        fillColor: const Color.fromRGBO(243, 243, 243, 1),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none
        )
      ),
    );
  }

  Widget _buildCodeTextField(){
    return TextFormField(
      validator: (value){
        if(value == null|| value.isEmpty){
          return "密码不能为空";
        }
        if(!RegExp(r"^[a-zA-Z0-9_]{6,16}$").hasMatch(value)){
          return"请输入6-16位的字母数字或者下划线";
        }
        return null;
      },
      controller: _codeController,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        hintText: "请输入密码",
        fillColor: const Color.fromRGBO(243, 243, 243, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25)
        )

      ),
    );
  }

  _login()async{
    try{
      final res = await loginAPI({
      "account":"${_accountController.text}",
      "password":"${_codeController.text}"
      });
      _usercontroller.upadeateUserInfo(res);
      ToastUtils.showToast(context, "登录成功");
      Navigator.pop(context);
    }catch(e){
      ToastUtils.showToast(context, (e as DioException).message);
    }
  }

  Widget _bulildLoginButton(){
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: (){
          if( _key.currentState!.validate()){
            if(_isChecked){
              _login();
            }else{
              ToastUtils.showToast(context, "请勾选用户协议");
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          )
        ),
        child: Text("登录",style: TextStyle(fontSize: 18,color: Colors.white),)
        ),
    );
  }
  
  bool _isChecked = false;
  Widget _buildCheckbox(){
    return Row(
      children: [
        Checkbox(
          value: _isChecked, 
          activeColor: Colors.black,
          checkColor: Colors.white,
          onChanged: (bool? value){
            _isChecked=value?? false;
            setState(() {
              
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10)
          ),
          side: BorderSide(color: Colors.grey,width: 2.0),
          ),
          Text.rich(
            TextSpan(
              children:[ 
                TextSpan(text: "查看并同意"),
                TextSpan(
                  text: "《隐私条款》",
                  style: TextStyle(color: Colors.blue)
                ),
                TextSpan(text: "和"),
                TextSpan(
                  text: "《用户协议》",
                  style: TextStyle(color: Colors.blue)
                )
              ] 
            )
          )
      ],
    );
  }

  Widget _buildHeader(){
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "账号密码登录",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("惠多美登录",style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _key,
        child: Container(
          padding: EdgeInsets.all(30),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildHeader(),
              SizedBox(height: 30),
              _buildAccountTextField(),
              SizedBox(height: 20),
              _buildCodeTextField(),
              SizedBox(height: 20),
              _buildCheckbox(),
              SizedBox(height: 20),
              _bulildLoginButton()
            ],
          ),
        )
      )
    
    );      
  }


}