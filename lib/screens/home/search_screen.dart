import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/homePage';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('SearchScreen'),
      ),
    );
  }
}