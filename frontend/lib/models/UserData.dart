
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Map _userData = {};

  Map get userData => _userData;

  set userData(Map UserDataParameter) {
    _userData = UserDataParameter;
    notifyListeners();
  }


  Map _userAddressData = {};

  Map get userAddressData => _userAddressData;

  set userAddressData(Map userAddressDataParameter) {
    _userAddressData = userAddressDataParameter;
    notifyListeners();
  }
  void getUserData()async{
    final SharedPreferences prefs = await _prefs;
    _userData = jsonDecode(prefs.getString("userData")!);
    notifyListeners();
  }
  void setUserDataFunc(Map UserDataParameter) async{
    _userData = UserDataParameter;
    final SharedPreferences prefs = await _prefs;
    prefs.setString("userData", jsonEncode(UserDataParameter));
    notifyListeners();
  }

  setUserAddressDataFunc(Map userAddressDataParameter) async{
    _userAddressData = userAddressDataParameter;
    final SharedPreferences prefs = await _prefs;
    prefs.setString("userAddressData", jsonEncode(userAddressDataParameter));
    notifyListeners();
  }

  getUserAddressData()async{

    final SharedPreferences prefs = await _prefs;
    _userAddressData = jsonDecode(prefs.getString("userAddressData")!) ;
    notifyListeners();
  }
}