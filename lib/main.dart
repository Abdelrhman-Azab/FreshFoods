import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/cubit/cubit.dart';
import 'package:fresh_food/cubit/states.dart';
import 'package:fresh_food/screens/home_screen.dart';
import 'package:fresh_food/screens/introduction/cubit/cubit.dart';
import 'package:fresh_food/screens/login/cubit/cubit.dart';
import 'package:fresh_food/screens/login/login_screen.dart';
import 'package:fresh_food/screens/introduction/introduction_screen.dart';
import 'package:fresh_food/screens/settings/settings_screen.dart';
import 'package:fresh_food/screens/signup/cubit/cubit.dart';
import 'package:fresh_food/screens/signup/signup_screen.dart';
import 'package:fresh_food/screens/tab_bar/tab_bar_screen.dart';
import 'package:fresh_food/shared/network/local/preferences_service.dart';
import 'package:fresh_food/style/my_colors.dart';

import 'bloc/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.sharedInit();
  Bloc.observer = MyBlocObserver();
  bool? isDark = CacheHelper().getBool(key: "isDark");
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => IntroductionCubit()),
        BlocProvider(create: (BuildContext context) => RegisterCubit()),
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(
            create: (BuildContext context) =>
                MainCubit()..changeTheme(fromShared: isDark)),
      ],
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                accentColor: Colors.white,
                primaryColor: baseFormFillColor,
                scaffoldBackgroundColor: Colors.grey[50]),
            darkTheme: ThemeData(
                primaryColor: baseFormFillDarkColor,
                scaffoldBackgroundColor: darkColor,
                accentColor: darkColor),
            themeMode:
                MainCubit.get(context).dark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: TabBarScreen(),
            routes: {
              SignUpScreen.id: (context) => SignUpScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              IntroductionScreen.id: (context) => IntroductionScreen(),
              HomeScreen.id: (context) => HomeScreen(),
              TabBarScreen.id: (context) => TabBarScreen()
            },
          );
        },
      ),
    );
  }
}
