import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPrefModule {
  @preResolve
  Future<SharedPreferences> provideSharedPreference() async {
    return await SharedPreferences.getInstance();



  }

}
