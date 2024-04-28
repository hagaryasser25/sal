import 'package:app_test/cubit/home/home_cubit.dart';
import 'package:app_test/cubit/home/home_state.dart';
import 'package:app_test/screens/home/search_screen.dart';
import 'package:app_test/shared/consts/constatnt.dart';
import 'package:app_test/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, SearchScreen.routeName);
                      SignOut(context);
                    },
                    icon: Icon(Icons.search))
              ],
              title: Text(
                'Salla',
                style: TextStyle(fontWeight: FontWeight.w600),
              )),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: defaultColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottom(index);
            },
          ),
        );
      },
    );
  }
}
