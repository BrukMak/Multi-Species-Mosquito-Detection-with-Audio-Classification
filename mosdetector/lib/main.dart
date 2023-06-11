 import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:mosdetector/features/core/splash_screen.dart';
 import 'package:mosdetector/features/mosqiuto/presentation/bloc/mosqiuto_bloc.dart';
 import 'package:mosdetector/features/mosqiuto/presentation/screens/home.dart';
 import 'package:mosdetector/features/mosqiuto/presentation/screens/recent_activity_page.dart';
 import 'features/mosqiuto/presentation/screens/recorder_page.dart';
 import 'injection/injection.dart' as di;
 import 'features/mosqiuto/presentation/screens/mosqiuto_detail_page.dart';

 void main() async {
   await di.init();
   runApp(const MyApp());
 }

 class MyApp extends StatelessWidget {
   const MyApp({super.key});  

   @override
   Widget build(BuildContext context) {
     return MultiBlocProvider(
       providers: [
         BlocProvider<MosqiutoBloc>(
           create: (context) => di.sl<MosqiutoBloc>()),
        
       ],
       child: const MaterialApp(
         title: 'Flutter Demo',
         home: SplashScreeen(),
         color: Colors.white,
       ),
     );
   }
 }

