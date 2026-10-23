import 'package:shared_preferences/shared_preferences.dart';

class save{
  Future<void>Login()async{
    SharedPreferences p = await SharedPreferences.getInstance();
    p.setBool('isLogin', true);    /// setbool it mean setter
  }
 
  //check user login or not
  Future <bool>isLoggedIn()async{
    SharedPreferences p= await SharedPreferences.getInstance();
    return p.getBool("isLogin")??false;
  }

  Future<void>Logout()async{
    SharedPreferences p = await SharedPreferences.getInstance();
    p.remove('isLogin');
  }

}