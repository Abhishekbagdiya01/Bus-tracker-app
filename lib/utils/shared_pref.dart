import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  //User's shared preference
  void setUserName(String name) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", name);
  }

  Future<String?> getUserName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? name = pref.getString('name');
    return name;
  }

}
