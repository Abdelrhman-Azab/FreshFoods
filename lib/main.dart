import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/screens/home_screen.dart';
import 'package:fresh_food/screens/introduction/cubit/cubit.dart';
import 'package:fresh_food/screens/login/cubit/cubit.dart';
import 'package:fresh_food/screens/login/login_screen.dart';
import 'package:fresh_food/screens/introduction/introduction_screen.dart';
import 'package:fresh_food/screens/signup/cubit/cubit.dart';
import 'package:fresh_food/screens/signup/signup_screen.dart';
import 'package:fresh_food/screens/tab_bar/tab_bar_screen.dart';

import 'bloc/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => IntroductionCubit()),
        BlocProvider(create: (BuildContext context) => RegisterCubit()),
        BlocProvider(create: (BuildContext context) => LoginCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        routes: {
          SignUpScreen.id: (context) => SignUpScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          IntroductionScreen.id: (context) => IntroductionScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          TabBarScreen.id: (context) => TabBarScreen()
        },
      ),
    );
  }
}
