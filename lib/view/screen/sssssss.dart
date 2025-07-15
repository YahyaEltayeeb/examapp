// import 'package:examapp/core/di/di.dart';
// import 'package:examapp/data/data_source/token_local_data_source.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//      final token= getIt<TokenLocalDataSource>();

//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(24),

//             child: Text(token.getToken().toString(),style: TextStyle(color: Colors.red),)
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:examapp/core/di/di.dart';
// import 'package:examapp/core/route/app_routes.dart';
// import 'package:examapp/data/data_source/token_local_data_source.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final tokenDataSource = getIt<TokenLocalDataSource>();

//     return Scaffold(
//       body: FutureBuilder<String?>(
//         future: tokenDataSource.getToken(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.all(24),
//               child: FilledButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, AppRoutes.forgetPassword);
//                 },
//                 child: Text(
//                   'go to forget password',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
