import 'package:flutter/material.dart';
import 'package:isp_bill_collector/Formatters/mailFormatter.dart';
import 'package:isp_bill_collector/Formatters/nameFormatter.dart';
import 'package:isp_bill_collector/Screen%20Sizes/screen_size_page.dart';

class UserDetails extends StatelessWidget {
  UserDetails({Key? key, required this.userDetails}) : super(key: key);

  List userDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context) * 1,
        width: displayWidth(context) * 1,
        color: Colors.black12,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: true,
              floating: true,
              expandedHeight: 160.0,
              backgroundColor: Colors.blue,
              flexibleSpace: FlexibleSpaceBar(
                // title: Text("User Details",
                //   style: TextStyle(
                //     color: Colors.blue,
                //   ),
                // ),
                background: Image.asset("assets/user.gif",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, index) {
                    return Column(
                      children: [
                        Padding(padding: EdgeInsets.all(8)),
                        ListTile(
                          title: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            color: Colors.white70,
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Padding(padding: EdgeInsets.fromLTRB(
                                        10, 20, 10, 10),
                                      child: Text(
                                        "Full Details",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 21
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: const [
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 0, 10),
                                            child: Text("Customer Name",
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 16
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Padding(padding: const EdgeInsets.fromLTRB(
                                            0, 10, 10, 10),
                                          child: Text(
                                            nameShortener(userDetails[index]['first'], userDetails[index]['last']),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: const [
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 0, 10),
                                            child: Text("Email",
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 16
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Padding(padding: const EdgeInsets.fromLTRB(
                                            0, 10, 10, 10),
                                          child: Text(
                                            mailShortener(userDetails[index]['email']),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: const [
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 0, 10),
                                            child: Text("Address",
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 16
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Padding(padding: const EdgeInsets.fromLTRB(
                                            0, 10, 10, 10),
                                          child: Text(
                                            userDetails[index]['address'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: const [
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 0, 10),
                                            child: Text("Expires On",
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 16
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Padding(padding: const EdgeInsets.fromLTRB(
                                            0, 10, 10, 10),
                                          child: Text(
                                            userDetails[index]['created'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ]
                            )
                          )
                        )
                      ]
                    );
                  },
                  childCount: 1,
                )
            ),
          ],
        ),
      ),
    );
  }
}

