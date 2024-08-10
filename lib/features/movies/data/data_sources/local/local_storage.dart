
import 'package:hive/hive.dart';

class LocalStorage{

  // databasenya saya beri nama login-session
  static const String _loginSession = 'login-session';

  // fungsi untuk meng-init table atau disebut box untuk package hive ini
  static Future<Box<E>> openBox<E>(String name) async {
    if(Hive.isBoxOpen(name)){
      return Hive.box<E>(name);
    }else{
      return await Hive.openBox<E>(name);
    }
  }

  // save data berupa keys dan value ke box
  static Future<void> saveData(Map<dynamic, dynamic> data) async {
    final session = await openBox(_loginSession);
    await session.putAll(data);
  }

  // fungsi untuk retrive sebuah key , value
  static Future<T> getData<T>(String key, {T? defaultValue}) async {
    final session = await openBox(_loginSession);
    return session.get(key, defaultValue: defaultValue);
  }

  // fungsi untuk clear atau hapus semua keys dan value
  static void deleteData() async {
    final session = await openBox(_loginSession);
    await session.clear();
  }
}