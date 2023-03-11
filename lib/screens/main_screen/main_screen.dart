import 'dart:convert';

import 'package:auth_bloc/bloc/auth_bloc/auth.dart';
import 'package:auth_bloc/model/cart_response_wrapper.dart';
import 'package:auth_bloc/repositories/repositories.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../new_profile.dart';

class MainScreen extends StatefulWidget {
  final UserRepository userRepository;

  MainScreen({required Key key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final storage = new FlutterSecureStorage();
  String? userId;
  Future<CartResponseWrapper>? cartResponseWrapper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserID();
  }

  getUserID() async {
    userId = await storage.read(key: "id");
    setState(() {});
    print("_____________________${userId}");

    if (userId != null) {
      cartResponseWrapper = getCartData(userId!);
    }
  }

  Future<CartResponseWrapper> getCartData(String userId) async {
    Response response = await http.post(
      Uri.parse("https://ecommerce.theprimoapp.com/api/get_cart_items"),
      body: {
        "user_id": userId,
      },
      headers: {
        'Cookie': 'ci_session=0d75972bc917147007c8cbe88cc0e46fa133fe7f'
      },
    );
    final body = json.decode(response.body);
    return CartResponseWrapper.fromJson(jsonDecode(response.body));
    // print("++++++++++++++++++++++++${cartResponseWrapper?.message}");

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: CircleAvatar(
        //     backgroundImage: NetworkImage(
        //         "https://yt3.ggpht.com/yti/ANoDKi5R5eJSjZigdWmIcZKFAtqwG4svMcAAN0Iyvw4j=s108-c-k-c0x00ffffff-no-rj"),
        //   ),
        // ),
        // title: Text("AUTH WITH REST"),
        actions: [
          // IconButton(
          //     icon: Icon(
          //       EvaIcons.logOutOutline,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {
          //       BlocProvider.of<AuthenticationBloc>(context).add(
          //         LoggedOut(),
          //       );
          //     }),
          IconButton(
              icon: Icon(
                Icons.cancel_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => NewProfile()));
              })
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;

            return FutureBuilder<CartResponseWrapper>(
              future: cartResponseWrapper,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Stack(
                    children: [
                      Container(
                        // color: Colors.red,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 1,
                                width: screenWidth,
                                color: Colors.black26,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.grey.shade200,
                                      ),
                                      child: Icon(
                                        Icons.card_giftcard,
                                        size: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: TextField(
                                          keyboardType: TextInputType.text,
                                          decoration:
                                              const InputDecoration.collapsed(
                                            // border: OutlineInputBorder(),
                                            hintText: 'USE DISCOUNT CODE',
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 1,
                                width: screenWidth,
                                color: Colors.black26,
                              ),
                              userId == "1"
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 15),
                                      child: SizedBox(
                                        height: screenHeight,
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              var cartData = snapshot
                                                  .data?.cartData?.first;

                                              return Column(
                                                children: [
                                                  Container(
                                                    height: 150,
                                                    // color: Colors.red,
                                                    child: Row(
                                                      children: [
                                                        Image.network(
                                                          cartData?.productImage ??
                                                              '',
                                                          width: 100,
                                                          height: 150,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'SNITCH',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              ),
                                                              // SizedBox(
                                                              //   height: 5,
                                                              // ),
                                                              Text(
                                                                cartData?.subProductName ??
                                                                    '',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                maxLines: 2,
                                                              ),
                                                              // SizedBox(
                                                              //   height: 10,
                                                              // ),
                                                              Text(
                                                                "GREY / ${cartData?.size}",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              // SizedBox(
                                                              //   height: 20,
                                                              // ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      "Quantity",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .grey,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Text(
                                                                          "—",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          cartData?.quantity ??
                                                                              '',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                24,
                                                                            color:
                                                                                Colors.grey,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          "+",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                24,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              // SizedBox(
                                                              //   height: 20,
                                                              // ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "₹ ${cartData?.price}",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .delete_forever_rounded,
                                                                    color: Colors
                                                                        .grey,
                                                                    size: 26,
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    width: screenWidth,
                                                    color: Colors.black26,
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                ],
                                              );
                                            }),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 200),
                                      child: Center(
                                          child: Text(
                                              snapshot.data?.message ?? '')),
                                    ),
                              // SizedBox(
                              //   height: 80,
                              // ),
                            ],
                          ),
                        ),
                      ),
                      if (userId == "1")
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              height: 56,
                              width: screenWidth,
                              child: RaisedButton(
                                color: Colors.black,
                                disabledTextColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                onPressed: () {},
                                child: const Text(
                                  "CHECK OUT",
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return Center(child: const CircularProgressIndicator());
              },
            );
          },
        ),
      ),
    );
  }
}
