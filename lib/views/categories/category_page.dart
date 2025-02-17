import 'package:flutter/material.dart';
import 'package:foodly/constants/constants.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        backgroundColor: kOffWhite,
        elevation: 0,
      ),
      body: Center(
         child: Text('Category page')
      ),
    );
  }
}
