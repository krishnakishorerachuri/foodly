import 'package:flutter/material.dart';

import '../../common/custom_container.dart';
import '../../constants/constants.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: PreferredSize(preferredSize: Size.fromHeight(130),
            child: Container(
              height: 130,
            )),
        body: SafeArea(child: CustomContainer(containerContent: Container(

        )))

    );
  }
}
