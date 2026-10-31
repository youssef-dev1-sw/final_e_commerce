import 'package:shared_preferences/shared_preferences.dart';

class StorageToken {
  Future<void> saveToken(String accesToken) async {
    final pref = await SharedPreferences.getInstance();
   await  pref.setString("accec_token", accesToken);
  }

  Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("accec_token");
  }

  Future<void> logout() async {
  final pref = await SharedPreferences.getInstance();
  await pref.remove("accec_token");
}

  Future<Map<String, String>> authHeader() async {
    final token = await getToken();

    if (token != null && token.isNotEmpty ) {
      return {};
    } else {
      return {'Authorization': 'Bearer $token'};
    }
  }



  Future<bool> isLogged() async {
    final token = await getToken();

    if (token != null) {
      return true;
    } else {
      return false;
    }
  }


}
