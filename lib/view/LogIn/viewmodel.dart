// import 'package:flutter/foundation.dart';
// import '../../dataSource/Model/ResponseLogin.dart';
// import '../../dataSource/repoImpl.dart';
//
//
// class UserViewModel extends ChangeNotifier {
//   final UserRepository _repository;
//
//   UserViewModel(this._repository);
//
//   // State
//   LoginModel? _loginModel;
//   User? _currentUser;
//   String? _token;
//   bool _isLoading = false;
//   String _errorMessage = '';
//
//   // Getters
//   LoginModel? get loginModel => _loginModel;
//
//   User? get currentUser => _currentUser;
//
//   String? get token => _token;
//
//   bool get isLoading => _isLoading;
//
//   String get errorMessage => _errorMessage;
//
//   bool get isLoggedIn => _token != null;
//
//   // Login
//   Future<bool> login(String email, String password) async {
//     _setLoading(true);
//     _clearError();
//
//     try {
//       _loginModel = await _repository.login(email, password);
//       _currentUser = _loginModel?.user;
//       _token = _loginModel?.token;
//
//       if (_token != null) {
//         // final prefs = await SharedPreferences.getInstance();
//         // await prefs.setString('auth_token', _token!);
//       }
//
//       _setLoading(false);
//       return true;
//     } catch (e) {
//       _setError(e.toString());
//       _setLoading(false);
//       return false;
//     }
//   }
// }