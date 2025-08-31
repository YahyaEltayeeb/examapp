import 'package:examapp/data/data_source/token_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: TokenLocalDataSource)
@LazySingleton(as: TokenLocalDataSource)
class TokenLocalDataSourceImp implements TokenLocalDataSource {
  TokenLocalDataSourceImp(this._prefs);
  final SharedPreferences _prefs;

  @override
  Future<String?> getToken() async {
    return _prefs.getString('token');
  }

  @override
  Future<void> saveToken(String token) async {
    await _prefs.setString('token', token);
  }

  @override
  Future<void> deleteToken() async {
    await _prefs.remove('token');
  }
}
