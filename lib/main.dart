import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/cubit/cubit.dart';
import 'package:fresh_food/cubit/states.dart';
import 'package:fresh_food/screens/cart/cubit/cubit.dart';
import 'package:fresh_food/screens/delivery_address/cubit/cubit.dart';
import 'package:fresh_food/screens/delivery_address/delivery_address_screen.dart';
import 'package:fresh_food/screens/home_screen.dart';
import 'package:fresh_food/screens/introduction/cubit/cubit.dart';
import 'package:fresh_food/screens/login/cubit/cubit.dart';
import 'package:fresh_food/screens/login/login_screen.dart';
import 'package:fresh_food/screens/introduction/introduction_screen.dart';
import 'package:fresh_food/screens/meal_details/meal_details_screen.dart';
import 'package:fresh_food/screens/order/cubit/cubit.dart';
import 'package:fresh_food/screens/order/order_screen.dart';
import 'package:fresh_food/screens/order/order_success_screen.dart';
import 'package:fresh_food/screens/product/product_screen.dart';
import 'package:fresh_food/screens/settings/cubit/cubit.dart';
import 'package:fresh_food/screens/shop/cubit/cubit.dart';
import 'package:fresh_food/screens/shop/shop_screen.dart';
import 'package:fresh_food/screens/signup/cubit/cubit.dart';
import 'package:fresh_food/screens/signup/signup_screen.dart';
import 'package:fresh_food/screens/tab_bar/tab_bar_screen.dart';
import 'package:fresh_food/shared/network/local/preferences_service.dart';
import 'package:fresh_food/shared/network/remote/dio.dart';
import 'package:fresh_food/style/myText.dart';
import 'package:fresh_food/style/my_colors.dart';
import 'bloc/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.sharedInit();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  bool? isDark = CacheHelper().getBool(key: "isDark");
  String? uid = CacheHelper().getUID();
  Widget startWidget;
  if (uid == null) {
    startWidget = LoginScreen();
  } else {
    startWidget = TabBarScreen();
  }
  runApp(MyApp(isDark, startWidget));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  Widget startWidget;

  MyApp(this.isDark, this.startWidget);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => IntroductionCubit()),
        BlocProvider(create: (BuildContext context) => RegisterCubit()),
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context) => SettingsCubit()),
        BlocProvider(create: (BuildContext context) => DeliveryCubit()),
        BlocProvider(create: (BuildContext context) => CartCubit()),
        BlocProvider(
            create: (BuildContext context) => ShopCubit()..getProducts()),
        BlocProvider(
            create: (BuildContext context) =>
                MainCubit()..changeTheme(fromShared: isDark)),
      ],
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                textTheme: TextTheme(bodyText1: bold16),
                accentColor: Colors.white,
                primaryColor: baseFormFillColor,
                scaffoldBackgroundColor: Colors.grey[50]),
            darkTheme: ThemeData.dark(),
            // ThemeData(
            //     primaryColor: Colors.grey[900],
            //     scaffoldBackgroundColor: Colors.black,
            //     accentColor: Colors.black12),
            themeMode:
                MainCubit.get(context).dark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: startWidget,
            routes: {
              SignUpScreen.id: (context) => SignUpScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              IntroductionScreen.id: (context) => IntroductionScreen(),
              HomeScreen.id: (context) => HomeScreen(),
              TabBarScreen.id: (context) => TabBarScreen(),
              MealDetailsScreen.id: (context) => MealDetailsScreen(),
              ShopScreen.id: (context) => ShopScreen(),
              ProductScreen.id: (context) => ProductScreen(),
              DeliveryAddress.id: (context) => DeliveryAddress(),
              OrderScreen.id: (context) => OrderScreen(),
              OrderSuccessScreen.id: (context) => OrderSuccessScreen(),
            },
          );
        },
      ),
    );
  }
}
