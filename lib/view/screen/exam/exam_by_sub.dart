import 'package:examapp/core/di/di.dart';
import 'package:examapp/view_model/exam/exam_by_sub_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/exam/exam_event.dart';

class ExamBySubView extends StatelessWidget {
  ExamBySubViewModel examBySubViewModel = getIt.get<ExamBySubViewModel>();
  final String subject;
  final int page;
  final int limit;

  ExamBySubView({
    Key? key,
     this.subject="670037f6728c92b7fdf434fc",
    this.page = 1,
    this.limit = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      examBySubViewModel..getExam(subject, page, limit),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<ExamBySubViewModel, ExamState>(
          builder: (BuildContext context, state) {
            if (state.isLoadingExam) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.erorrExam.isNotEmpty) {
              return Center(child: Text("Error: ${state.erorrExam}"));
            }
            if (state.exam.isEmpty) {
              return const Center(child: Text("No exams available."));
            }
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with icon and title
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.school,
                          color: Colors.orange,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Languages',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '${state.exam.first.duration} minitues',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Level and questions info
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'High level',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '${state.exam.first.numberOfQuestions} questions',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Instructions title
                  const Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Instructions list
                  Column(
                    children: [
                      _buildInstructionItem(
                          'Lorem ipsum dolor sit amet consectetur.'),
                      const SizedBox(height: 12),
                      _buildInstructionItem(
                          'Lorem ipsum dolor sit amet consectetur.'),
                      const SizedBox(height: 12),
                      _buildInstructionItem(
                          'Lorem ipsum dolor sit amet consectetur.'),
                      const SizedBox(height: 12),
                      _buildInstructionItem(
                          'Lorem ipsum dolor sit amet consectetur.'),
                    ],
                  ),

                  const SizedBox(height: 50),

                  // Start button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Start button pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E40AF),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: const Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInstructionItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 6,
          height: 6,
          margin: const EdgeInsets.only(top: 8, right: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade600,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
// // import 'package:examapp/core/di/di.dart';
// // import 'package:examapp/view_model/exam/exam_by_sub_cubit.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// //
// // import '../../../view_model/exam/exam_event.dart';
// //
// // class ExamBySubView extends StatelessWidget {
// //
// //   ExamBySubViewModel examBySubViewModel=getIt.get<ExamBySubViewModel>();
// //   final String subject ;
// //   final int page;
// //   final int limit;
// //
// //   ExamBySubView({
// //     Key? key,
// //     required this.subject,
// //     this.page = 1,
// //     this.limit = 10,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create:(context)=> examBySubViewModel..getExam(subject, page, limit),
// //       child: Scaffold(
// //         backgroundColor: const Color(0xFFF5F5F5),
// //         appBar: AppBar(
// //           backgroundColor: const Color(0xFFF5F5F5),
// //           elevation: 0,
// //           leading: IconButton(
// //             icon: const Icon(
// //               Icons.arrow_back_ios,
// //               color: Colors.black,
// //               size: 20,
// //             ),
// //             onPressed: () => Navigator.pop(context),
// //           ),
// //         ),
// //         body: BlocBuilder<ExamBySubViewModel, ExamState>(
// //
// //           builder: (BuildContext context, state) {
// //             if (state.isLoadingExam) {
// //               return const Center(child: CircularProgressIndicator());
// //             }
// //             if (state.erorrExam.isNotEmpty) {
// //               return Center(child: Text("Error: ${state.erorrExam}"));
// //             }if (state.exam.isEmpty) {
// //               return const Center(child: Text("No exams available."));
// //             }
// //             return Padding(
// //                 padding: const EdgeInsets.all(20.0),
// //             child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //             // Header with icon and title
// //             Row(
// //             children: [
// //             Container(
// //             width: 50,
// //             height: 50,
// //             decoration: BoxDecoration(
// //             color: Colors.orange.shade100,
// //             borderRadius: BorderRadius.circular(12),
// //             ),
// //             child: const Icon(
// //             Icons.school,
// //             color: Colors.orange,
// //           }
// //                         size: 30,
// //                       ),
// //                     ),
// //                     const SizedBox(width: 16),
// //                     Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         const Text(
// //                           'Languages',
// //                           style: TextStyle(
// //                             fontSize: 24,
// //                             fontWeight: FontWeight.bold,
// //                             color: Colors.black,
// //                           ),
// //                         ),
// //                         Text(
// //                           '30 Minutes',
// //                           style: TextStyle(
// //                             fontSize: 16,
// //                             color: Colors.blue.shade600,
// //                             fontWeight: FontWeight.w500,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //
// //                 const SizedBox(height: 32),
// //
// //                 // Level and questions info
// //                 Row(
// //                   children: [
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //                       decoration: BoxDecoration(
// //                         color: Colors.grey.shade200,
// //                         borderRadius: BorderRadius.circular(16),
// //                       ),
// //                       child: const Text(
// //                         'High level',
// //                         style: TextStyle(
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.w600,
// //                           color: Colors.black,
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(width: 12),
// //                     Text(
// //                       '20 Question',
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         color: Colors.grey.shade600,
// //                         fontWeight: FontWeight.w500,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //
// //                 const SizedBox(height: 32),
// //
// //                 // Instructions title
// //                 const Text(
// //                   'Instructions',
// //                   style: TextStyle(
// //                     fontSize: 20,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 20),
// //
// //                 // Instructions list
// //                 Column(
// //                   children: [
// //                     _buildInstructionItem('Lorem ipsum dolor sit amet consectetur.'),
// //                     const SizedBox(height: 12),
// //                     _buildInstructionItem('Lorem ipsum dolor sit amet consectetur.'),
// //                     const SizedBox(height: 12),
// //                     _buildInstructionItem('Lorem ipsum dolor sit amet consectetur.'),
// //                     const SizedBox(height: 12),
// //                     _buildInstructionItem('Lorem ipsum dolor sit amet consectetur.'),
// //                   ],
// //                 ),
// //
// //                SizedBox(height: 50,),
// //
// //                 // Start button
// //                 Container(
// //                   width: double.infinity,
// //                   height: 56,
// //                   child: ElevatedButton(
// //                     onPressed: () {
// //                       // Add your start functionality here
// //                       print('Start button pressed');
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: const Color(0xFF1E40AF),
// //                       foregroundColor: Colors.white,
// //                       elevation: 0,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(28),
// //                       ),
// //                     ),
// //                     child: const Text(
// //                       'Start',
// //                       style: TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 40),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildInstructionItem(String text) {
// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Container(
// //           width: 6,
// //           height: 6,
// //           margin: const EdgeInsets.only(top: 8, right: 12),
// //           decoration: BoxDecoration(
// //             color: Colors.grey.shade600,
// //             shape: BoxShape.circle,
// //           ),
// //         ),
// //         Expanded(
// //           child: Text(
// //             text,
// //             style: TextStyle(
// //               fontSize: 16,
// //               color: Colors.grey.shade700,
// //               height: 1.4,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
//
//