import 'package:app_test/cubit/home/home_cubit.dart';
import 'package:app_test/cubit/login/login_cubit.dart';
import 'package:app_test/screens/auth/shop_login.dart';
import 'package:app_test/screens/home/home.dart';
import 'package:app_test/screens/home/search_screen.dart';
import 'package:app_test/screens/on_boarding.dart';
import 'package:app_test/shared/network/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/login/login_state.dart';
import 'cubit/observer.dart';
import 'dio/dio_helper.dart';
import 'shared/consts/constatnt.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  print(token);
  Widget widget;

  if (onBoarding != null) {
    if (token != null)
      widget = HomePage();
    else
      widget = LoginPage();
  } else {
    widget = OnBoarding();
  }
  runApp(MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => LoginCubit()),
          BlocProvider(
              create: (BuildContext context) => HomeCubit()
                ..getHomeData()
                ..getCategoriesData()
                ..getFavoritesData()),
        ],
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                fontFamily: 'PlayFair',
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
                useMaterial3: true,
              ),
              home: startWidget,
              routes: {
                LoginPage.routeName: (ctx) => const LoginPage(),
                HomePage.routeName: (ctx) => const HomePage(),
                SearchScreen.routeName: (ctx) => const SearchScreen(),
              },
            );
          },
        ));
  }
}
