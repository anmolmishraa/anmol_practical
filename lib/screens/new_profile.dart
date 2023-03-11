import 'package:auth_bloc/screens/category_screen.dart';
import 'package:auth_bloc/screens/home_screen.dart';
import 'package:auth_bloc/screens/more_screen.dart';
import 'package:auth_bloc/screens/sign_out.dart';
import 'package:auth_bloc/screens/whats_new_screen.dart';
import 'package:flutter/material.dart';

class NewProfile extends StatefulWidget {
  const NewProfile({Key? key}) : super(key: key);

  @override
  _NewProfileState createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  int pageIndex = 0;

  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const SignOut(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: pages[pageIndex],
        ),
        bottomNavigationBar: buildMyNavBar(context),
      ),
    );
  }

  Widget buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                    size: 25,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.widgets_outlined,
                    color: Colors.black,
                    size: 25,
                  )
                : const Icon(
                    Icons.widgets_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                    Icons.shopping_bag,
                    color: Colors.black,
                    size: 25,
                  )
                : const Icon(
                    Icons.shopping_bag,
                    color: Colors.black,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 25,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.black,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 4;
              });
            },
            icon: pageIndex == 4
                ? const Icon(
                    Icons.menu_outlined,
                    color: Colors.black,
                    size: 25,
                  )
                : const Icon(
                    Icons.menu_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
          ),
        ],
      ),
    );
  }
}
