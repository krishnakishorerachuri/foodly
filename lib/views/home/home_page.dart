import 'package:flutter/material.dart';
import 'package:foodly/common/custom_container.dart';
import 'package:foodly/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
        appBar: PreferredSize(preferredSize: Size.fromHeight(130),
            child: Container(
              height: 130,
            )),
        body: SafeArea(child: CustomContainer(containerContent: Container()))

    );
  }
}
