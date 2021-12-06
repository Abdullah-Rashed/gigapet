// import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/layout/gigapet/gigapet_layout.dart';
import 'package:gigapet/modules/homee/home_screen.dart';
import 'package:gigapet/modules/identity/identity_screen.dart';
import 'package:gigapet/modules/profile/edit_profile_screen.dart';
import 'package:gigapet/modules/profile/owner_profile_screen.dart';
import 'package:gigapet/modules/sign_in/sign_in_screen.dart';
import 'package:gigapet/modules/sign_up/owner_sign_up_screen.dart';
import 'package:gigapet/modules/sign_up/pet_sign_up_screen.dart';
import 'package:gigapet/shared/bloc_observer.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:to_do_app/layout/news_app/news_layout.dart';
// import 'package:to_do_app/layout/todo_app/todo_layout.dart';
// import 'package:to_do_app/modules/counter/counter_screen.dart';
// import 'package:to_do_app/modules/counter/cubit/cubit.dart';
// import 'package:to_do_app/modules/todo_app/tasks/tasks_screen.dart';
// import 'package:to_do_app/shared/remote/dio_helper.dart';
// import 'shared/bloc_observer.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Bloc.observer = MyBlocObserver();
  // DioHelper.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          color: Colors.white,
          elevation: 0
        )
      ),
      home: const SignInScreen()
    );
  }
}

