import 'package:shared_preferences/shared_preferences.dart';

import '../login_ui/modal/login_ui.dart';

class Shared_Praferece {

  Future<void> SingUp({required String email,required String password,bool? login})
  async {
    SharedPreferences  Shar = await SharedPreferences.getInstance();
    Shar.setString('g1', email);
    Shar.setString('p1', password);
    Shar.setBool('login', login!);
  }

  Future<Map> readData() async {
    SharedPreferences share= await SharedPreferences.getInstance();
    String? email = share.getString("g1");
    String? password = share.getString("p1");

    print(email);
    print(password);

    Map m1 = {"g1":email,"p1":password};

    return m1;
  }
}