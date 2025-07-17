// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:dio/dio.dart';
// import 'injection_container.dart' as di;
// import 'features/auth/presentation/pages/login_page.dart';
// import 'features/auth/presentation/cubit/auth_cubit.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await di.init();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter MVVM Cubit',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BlocProvider(
//         create: (context) => di.sl<AuthCubit>(),
//         child: LoginPage(),
//       ),
//     );
//   }
// }
//
// // 2. lib/injection_container.dart
// import 'package:get_it/get_it.dart';
// import 'package:dio/dio.dart';
// import 'features/auth/data/datasources/auth_remote_datasource.dart';
// import 'features/auth/data/repositories/auth_repository_impl.dart';
// import 'features/auth/domain/repositories/auth_repository.dart';
// import 'features/auth/domain/usecases/login_usecase.dart';
// import 'features/auth/presentation/cubit/auth_cubit.dart';
// import 'ApiManager/ApiManager.dart';
// import 'ApiManager/Dio/Dio.dart';
//
// final sl = GetIt.instance;
//
// Future<void> init() async {
//   // External
//   final dio = DioClient.createDio();
//   sl.registerLazySingleton<Dio>(() => dio);
//
//   // API Service
//   sl.registerLazySingleton<ApiManager>(() => ApiManager(sl()));
//
//   // Data sources
//   sl.registerLazySingleton<AuthRemoteDataSource>(
//         () => AuthRemoteDataSourceImpl(sl()),
//   );
//
//   // Repositories
//   sl.registerLazySingleton<AuthRepository>(
//         () => AuthRepositoryImpl(sl()),
//   );
//
/// Use cases
//   sl.registerLazySingleton(() => LoginUseCase(sl()));
//
//   // Cubit
//   sl.registerFactory(() => AuthCubit(sl()));
// }
//
// // 3. lib/features/auth/domain/entities/user.dart
// class User {
//   final String id;
//   final String token;
//   final String username;
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String phone;
//   final String role;
//   final bool isVerified;
//   final String createdAt;
//
//   User({
//     required this.id,
//     required this.token,
//     required this.username,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.phone,
//     required this.role,
//     required this.isVerified,
//     required this.createdAt,
//   });
//
//   String get fullName => '$firstName $lastName';
// }
//
// // 4. lib/features/auth/domain/repositories/auth_repository.dart
// import 'package:dartz/dartz.dart';
// import '../entities/user.dart';
// import '../../../../core/error/failures.dart';
//
// abstract class AuthRepository {
//   Future<Either<Failure, User>> login(String username, String password);
// }
//
// // 5. lib/features/auth/domain/usecases/login_usecase.dart
// import 'package:dartz/dartz.dart';
// import '../entities/user.dart';
// import '../repositories/auth_repository.dart';
// import '../../../../core/error/failures.dart';
// import '../../../../core/usecases/usecase.dart';
//
// class LoginUseCase implements UseCase<User, LoginParams> {
//   final AuthRepository repository;
//
//   LoginUseCase(this.repository);
//
//   @override
//   Future<Either<Failure, User>> call(LoginParams params) async {
//     return await repository.login(params.username, params.password);
//   }
// }
//
// class LoginParams {
//   final String username;
//   final String password;
//
//   LoginParams({required this.username, required this.password});
// }
//
// // 6. lib/core/usecases/usecase.dart
// import 'package:dartz/dartz.dart';
// import '../error/failures.dart';
//
// abstract class UseCase<Type, Params> {
//   Future<Either<Failure, Type>> call(Params params);
// }
//
// // 7. lib/core/error/failures.dart
// abstract class Failure {
//   final String message;
//   const Failure(this.message);
// }
//
// class ServerFailure extends Failure {
//   const ServerFailure(String message) : super(message);
// }
//
// class NetworkFailure extends Failure {
//   const NetworkFailure(String message) : super(message);
// }
//
// // 8. lib/features/auth/data/datasources/auth_remote_datasource.dart
// import '../models/user_model.dart';
// import '../../../../ApiManager/ApiManager.dart';
// import '../../../../ApiManager/LoginRequest.dart';
//
// abstract class AuthRemoteDataSource {
//   Future<UserModel> login(String username, String password);
// }
//
// class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
//   final ApiManager apiService;
//
//   AuthRemoteDataSourceImpl(this.apiService);
//
//   @override
//   Future<UserModel> login(String username, String password) async {
//     final request = LoginRequest(username: username, password: password);
//     final response = await apiService.login(request);
//     return UserModel.fromResponse(response);
//   }
// }
//
// // 9. lib/features/auth/data/models/user_model.dart
// import 'package:json_annotation/json_annotation.dart';
// import '../../domain/entities/user.dart';
// import '../../../../ApiManager/LoginResponse.dart';
//
// part 'user_model.g.dart';
//
// @JsonSerializable()
// class UserModel extends User {
//   UserModel({
//     required String id,
//     required String token,
//     required String username,
//     required String firstName,
//     required String lastName,
//     required String email,
//     required String phone,
//     required String role,
//     required bool isVerified,
//     required String createdAt,
//   }) : super(
//     id: id,
//     token: token,
//     username: username,
//     firstName: firstName,
//     lastName: lastName,
//     email: email,
//     phone: phone,
//     role: role,
//     isVerified: isVerified,
//     createdAt: createdAt,
//   );
//
//   factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
//   Map<String, dynamic> toJson() => _$UserModelToJson(this);
//
//   factory UserModel.fromResponse(LoginResponse response) {
//     return UserModel(
//       id: response.user.id,
//       token: response.token,
//       username: response.user.username,
//       firstName: response.user.firstName,
//       lastName: response.user.lastName,
//       email: response.user.email,
//       phone: response.user.phone,
//       role: response.user.role,
//       isVerified: response.user.isVerified,
//       createdAt: response.user.createdAt,
//     );
//   }
// }
//
// // 10. lib/features/auth/data/repositories/auth_repository_impl.dart
// import 'package:dartz/dartz.dart';
// import '../../domain/entities/user.dart';
// import '../../domain/repositories/auth_repository.dart';
// import '../datasources/auth_remote_datasource.dart';
// import '../../../../core/error/failures.dart';
// import 'package:dio/dio.dart';
//
// class AuthRepositoryImpl implements AuthRepository {
//   final AuthRemoteDataSource remoteDataSource;
//
//   AuthRepositoryImpl(this.remoteDataSource);
//
//   @override
//   Future<Either<Failure, User>> login(String username, String password) async {
//     try {
//       final user = await remoteDataSource.login(username, password);
//       return Right(user);
//     } on DioException catch (e) {
//       return Left(ServerFailure(e.message ?? 'Server error'));
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
// }
//
// // 11. lib/features/auth/presentation/cubit/auth_state.dart
// part of 'auth_cubit.dart';
//
// abstract class AuthState {}
//
// class AuthInitial extends AuthState {}
//
// class AuthLoading extends AuthState {}
//
// class AuthSuccess extends AuthState {
//   final User user;
//   AuthSuccess(this.user);
// }
//
// class AuthFailure extends AuthState {
//   final String message;
//   AuthFailure(this.message);
// }
//
// // إضافة shared preferences للـ Remember Me
// // lib/core/storage/shared_preferences_helper.dart
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPreferencesHelper {
//   static const String _tokenKey = 'auth_token';
//   static const String _rememberMeKey = 'remember_me';
//   static const String _userDataKey = 'user_data';
//
//   static Future<void> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_tokenKey, token);
//   }
//
//   static Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_tokenKey);
//   }
//
//   static Future<void> saveRememberMe(bool remember) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(_rememberMeKey, remember);
//   }
//
//   static Future<bool> getRememberMe() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(_rememberMeKey) ?? false;
//   }
//
//   static Future<void> saveUserData(String userData) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_userDataKey, userData);
//   }
//
//   static Future<String?> getUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_userDataKey);
//   }
//
//   static Future<void> clearAll() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
// }
//
// // تحديث الـ AuthCubit ليدعم Remember Me
// // lib/features/auth/presentation/cubit/auth_cubit.dart
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'dart:convert';
// import '../../domain/entities/user.dart';
// import '../../domain/usecases/login_usecase.dart';
// import '../../../../core/storage/shared_preferences_helper.dart';
//
// part 'auth_state.dart';
//
// class AuthCubit extends Cubit<AuthState> {
//   final LoginUseCase loginUseCase;
//
//   AuthCubit(this.loginUseCase) : super(AuthInitial());
//
//   Future<void> checkAuthStatus() async {
//     final token = await SharedPreferencesHelper.getToken();
//     final userData = await SharedPreferencesHelper.getUserData();
//
//     if (token != null && userData != null) {
//       try {
//         final userMap = jsonDecode(userData);
//         final user = User(
//           id: userMap['id'],
//           token: token,
//           username: userMap['username'],
//           firstName: userMap['firstName'],
//           lastName: userMap['lastName'],
//           email: userMap['email'],
//           phone: userMap['phone'],
//           role: userMap['role'],
//           isVerified: userMap['isVerified'],
//           createdAt: userMap['createdAt'],
//         );
//         emit(AuthSuccess(user));
//       } catch (e) {
//         emit(AuthInitial());
//       }
//     }
//   }
//
//   Future<void> login(String username, String password, {bool rememberMe = false}) async {
//     emit(AuthLoading());
//
//     final result = await loginUseCase(LoginParams(
//       username: username,
//       password: password,
//     ));
//
//     result.fold(
//           (failure) => emit(AuthFailure(failure.message)),
//           (user) async {
//         if (rememberMe) {
//           await SharedPreferencesHelper.saveToken(user.token);
//           await SharedPreferencesHelper.saveRememberMe(true);
//           await SharedPreferencesHelper.saveUserData(jsonEncode({
//             'id': user.id,
//             'username': user.username,
//             'firstName': user.firstName,
//             'lastName': user.lastName,
//             'email': user.email,
//             'phone': user.phone,
//             'role': user.role,
//             'isVerified': user.isVerified,
//             'createdAt': user.createdAt,
//           }));
//         }
//         emit(AuthSuccess(user));
//       },
//     );
//   }
//
//   Future<void> logout() async {
//     await SharedPreferencesHelper.clearAll();
//     emit(AuthInitial());
//   }
// }
//
// // 13. lib/features/auth/presentation/pages/login_page.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../cubit/auth_cubit.dart';
// import 'home_page.dart';
// import '../../../../core/theme/AppStyles.dart';
// import '../../../../core/theme/CustomWidget/CustomButtom.dart';
// import '../../../../core/theme/CustomWidget/CustomTextField.dart';
// import '../../../../core/theme/app_colors.dart';
// import '../widgets/RemememberMeWidget.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _rememberMe = false;
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           "Login",
//           style: AppStyles.medium20White.copyWith(color: AppColors.black),
//         ),
//         titleSpacing: 0,
//       ),
//       body: BlocListener<AuthCubit, AuthState>(
//         listener: (context, state) {
//           if (state is AuthSuccess) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => BlocProvider.value(
//                   value: context.read<AuthCubit>(),
//                   child: HomePage(),
//                 ),
//               ),
//             );
//           } else if (state is AuthFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(state.message),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           }
//         },
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 24),
//                   CustomTextFormField(
//                     controller: _emailController,
//                     borderColor: AppColors.grey,
//                     label: Text(
//                       "Enter Your Email",
//                       style: AppStyles.regular14Text.copyWith(color: AppColors.black),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}
//
// // 14. lib/features/auth/presentation/pages/home_page.dart
//                           import 'package:flutter/material.dart';
//                           import 'package:flutter_bloc/flutter_bloc.dart';
//                           import '../cubit/auth_cubit.dart';
//                           import 'login_page.dart';
//
//                           class HomePage extends StatelessWidget {
//                           @override
//                           Widget build(BuildContext context) {
//                           return Scaffold(
//                           appBar: AppBar(
//                           title: Text('Home'),
//                           actions: [
//                           IconButton(
//                           icon: Icon(Icons.logout),
//                           onPressed: () {
//                           context.read<AuthCubit>().logout();
// // lib/core/theme/CustomWidget/CustomButtom.dart
//                           import 'package:flutter/material.dart';
//
//                           class CustomButton extends StatelessWidget {
//                           final String text;
//                           final VoidCallback? onButtonClicked;
//                           final Color buttonColor;
//                           final TextStyle textStyle;
//
//                           const CustomButton({
//                           Key? key,
//                           required this.text,
//                           required this.onButtonClicked,
//                           required this.buttonColor,
//                           required this.textStyle,
//                           }) : super(key: key);
//
//                           @override
//                           Widget build(BuildContext context) {
//                           return SizedBox(
//                           width: double.infinity,
//                           height: 50,
//                           child: ElevatedButton(
//                           onPressed: onButtonClicked,
//                           style: ElevatedButton.styleFrom(
//                           backgroundColor: buttonColor,
//                           shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           ),
//                           elevation: 0,
//                           ),
//                           child: Text(
//                           text,
//                           style: textStyle,
//                           ),
//                           ),
//                           );
//                           }
//                           }
//
// // lib/core/theme/CustomWidget/CustomTextField.dart
//                           import 'package:flutter/material.dart';
//
//                           class CustomTextFormField extends StatelessWidget {
//                           final TextEditingController? controller;
//                           final Color borderColor;
//                           final Widget label;
//                           final bool obscureText;
//                           final String? Function(String?)? validator;
//
//                           const CustomTextFormField({
//                           Key? key,
//                           this.controller,
//                           required this.borderColor,
//                           required this.label,
//                           this.obscureText = false,
//                           this.validator,
//                           }) : super(key: key);
//
//                           @override
//                           Widget build(BuildContext context) {
//                           return TextFormField(
//                           controller: controller,
//                           obscureText: obscureText,
//                           validator: validator,
//                           decoration: InputDecoration(
//                           labelText: label is Text ? (label as Text).data : null,
//                           labelStyle: label is Text ? (label as Text).style : null,
//                           border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(color: borderColor),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(color: borderColor),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(color: borderColor, width: 2),
//                           ),
//                           errorBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: const BorderSide(color: Colors.red),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: const BorderSide(color: Colors.red, width: 2),
//                           ),
//                           ),
//                           );
//                           }
//                           }
//
// // تحديث الـ HomePage navigation
//                           Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                           builder: (context) => BlocProvider.value(
//                           value: context.read<AuthCubit>(),
//                           child: const LoginScreen(),
//                           ),
//                           ),
//                           );
//                           },
//                           ),
//                           ],
//                           ),
//                           body: BlocBuilder<AuthCubit, AuthState>(
//                           builder: (context, state) {
//                           if (state is AuthSuccess) {
//                           final user = state.user;
//                           return Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                           Card(
//                           child: Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                           Text(
//                           'Welcome, ${user.fullName}!',
//                           style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           ),
//                           ),
//                           SizedBox(height: 16),
//                           _buildInfoRow('Username:', user.username),
//                           _buildInfoRow('Email:', user.email),
//                           _buildInfoRow('Phone:', user.phone),
//                           _buildInfoRow('Role:', user.role),
//                           _buildInfoRow('Verified:', user.isVerified ? 'Yes' : 'No'),
//                           _buildInfoRow('Created At:', _formatDate(user.createdAt)),
//                           ],
//                           ),
//                           ),
//                           ),
//                           SizedBox(height: 20),
//                           Card(
//                           child: Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                           Text(
//                           'Token Information',
//                           style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                           'Token: ${user.token.substring(0, 50)}...',
//                           style: TextStyle(
//                           fontSize: 12,
//                           fontFamily: 'monospace',
//                           ),
//                           ),
//                           ],
//                           ),
//                           ),
//                           ),
//                           ],
//                           ),
//                           );
//                           }
//                           return Center(child: Text('Not logged in'));
//                           },
//                           ),
//                           );
//                           }
//
//                           Widget _buildInfoRow(String label, String value) {
//                           return Padding(
//                           padding: EdgeInsets.symmetric(vertical: 4.0),
//                           child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                           SizedBox(
//                           width: 100,
//                           child: Text(
//                           label,
//                           style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[600],
//                           ),
//                           ),
//                           ),
//                           Expanded(
//                           child: Text(
//                           value,
//                           style: TextStyle(fontSize: 16),
//                           ),
//                           ),
//                           ],
//                           ),
//                           );
//                           }
//
//                           String _formatDate(String dateString) {
//                           try {
//                           final date = DateTime.parse(dateString);
//                           return '${date.day}/${date.month}/${date.year}';
//                           } catch (e) {
//                           return dateString;
//                           }
//                           }
//                           }).hasMatch(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 24),
//                   CustomTextFormField(
//                     controller: _passwordController,
//                     borderColor: AppColors.grey,
//                     label: Text(
//                       "Enter Your Password",
//                       style: AppStyles.regular14Text.copyWith(color: AppColors.black),
//                     ),
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       if (value.length < 6) {
//                         return 'Password must be at least 6 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   RememberMeWidget(
//                     value: _rememberMe,
//                     onChanged: (value) {
//                       setState(() {
//                         _rememberMe = value;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 48),
//                   BlocBuilder<AuthCubit, AuthState>(
//                     builder: (context, state) {
//                       return CustomButton(
//                         text: state is AuthLoading ? 'Loading...' : 'Login',
//                         onButtonClicked: state is AuthLoading
//                             ? null
//                             : () {
//                           if (_formKey.currentState!.validate()) {
//                             context.read<AuthCubit>().login(
//                               _emailController.text.trim(),
//                               _passwordController.text,
//                             );
//                           }
//                         },
//                         buttonColor: state is AuthLoading
//                             ? AppColors.grey
//                             : AppColors.blue,
//                         textStyle: AppStyles.medium18White,
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   // Loading indicator
//                   BlocBuilder<AuthCubit, AuthState>(
//                     builder: (context, state) {
//                       if (state is AuthLoading) {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//                       return const SizedBox.shrink();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // 14. lib/features/auth/presentation/pages/home_page.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../cubit/auth_cubit.dart';
// import 'login_page.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               context.read<AuthCubit>().logout();
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => BlocProvider.value(
//                     value: context.read<AuthCubit>(),
//                     child: LoginPage(),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: BlocBuilder<AuthCubit, AuthState>(
//         builder: (context, state) {
//           if (state is AuthSuccess) {
//             final user = state.user;
//             return Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Card(
//                     child: Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Welcome, ${user.fullName}!',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 16),
//                           _buildInfoRow('Username:', user.username),
//                           _buildInfoRow('Email:', user.email),
//                           _buildInfoRow('Phone:', user.phone),
//                           _buildInfoRow('Role:', user.role),
//                           _buildInfoRow('Verified:', user.isVerified ? 'Yes' : 'No'),
//                           _buildInfoRow('Created At:', _formatDate(user.createdAt)),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Card(
//                     child: Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Token Information',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             'Token: ${user.token.substring(0, 50)}...',
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontFamily: 'monospace',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//           return Center(child: Text('Not logged in'));
//         },
//       ),
//     );
//   }
//
//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value,
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   String _formatDate(String dateString) {
//     try {
//       final date = DateTime.parse(dateString);
//       return '${date.day}/${date.month}/${date.year}';
//     } catch (e) {
//       return dateString;
//     }
//   }
// }