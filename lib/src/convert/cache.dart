import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<List> cacheGetList(String key) async {
  //print('get - ' + key);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String val = prefs.getString(key);
  if((val != null) && (val is String)) {    
    dynamic data = json.decode(val);
    //print(data);
    return data;
  }
  return null;
}

void cacheSaveList(String key, dynamic data) async {
  //print('save - ' + key);
  if((data != null) && (data is List)) {    
    String val = json.encode(data);
    if((val != null) && (val is String)) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(key, val);
      //print('saved');
    }
  }
}
