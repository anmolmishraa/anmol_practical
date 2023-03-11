import 'package:auth_bloc/bloc/auth_bloc/auth_bloc.dart';
import 'package:auth_bloc/bloc/auth_bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOut extends StatefulWidget {
  const SignOut({Key? key}) : super(key: key);

  @override
  State<SignOut> createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "PROFILE",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 2,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.account_circle_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 14, top: 8, bottom: 8, right: 14),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MY ORDERS",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        "Order Status,History and Tracking",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
            Divider(
              height: 15,
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.only(left: 14, top: 8, bottom: 8, right: 14),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MY FAVORITES",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        "Manage and view favorites items.",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
            Divider(
              height: 15,
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.only(left: 14, top: 8, bottom: 8, right: 14),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MY POINTS",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        "View and check total points.",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
            Divider(
              height: 15,
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.only(left: 14, top: 8, bottom: 8, right: 14),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PROFILE",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        "Manage your profile.",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
            Divider(
              height: 15,
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.only(left: 14, top: 8, bottom: 8, right: 14),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ADDRESS",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        "Manage your address.",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
            Divider(
              height: 15,
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.only(left: 14, top: 8, bottom: 8, right: 14),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "RECENTLE..",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        "See recent view items.",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
            Divider(
              height: 15,
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.only(left: 14, top: 8, bottom: 8, right: 14),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ACCOUNTS DELETION",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        "Require permanent account deletion.",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
            Divider(
              height: 15,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  child: Text(
                    "SIGN OUT",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    side: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    showDataAlert();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showDataAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            // contentPadding: EdgeInsets.only(
            //   top: 10.0,
            // ),
            title: Container(
                width: 20,
                height: 30,
                child: Image.asset(
                  "assets/icons/alert.png",
                )),
            content: Container(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "SIGN OUT ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 13),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(
                                  LoggedOut(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                // fixedSize: Size(250, 50),
                              ),
                              child: Text(
                                "SIGN OUT",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                // fixedSize: Size(250, 50),
                              ),
                              child: Text(
                                "CANCLE",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
