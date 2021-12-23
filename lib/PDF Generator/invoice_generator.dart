import 'package:flutter/material.dart';

class Invoice extends StatelessWidget {
  List userDetails;
  var month;
  var price;
  Invoice({Key? key, required this.userDetails, required this.month, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(padding: EdgeInsets.fromLTRB(
                      10, 20, 10, 10),
                    child: Text(
                      "XYZ Internet Provider",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18
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
                          child: Text("First Name: ",
                            style: TextStyle(
                                color: Colors.black,
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
                          userDetails[0]['first'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
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
                          child: Text("Last Name: ",
                            style: TextStyle(
                                color: Colors.black,
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
                          userDetails[0]['last'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
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
                          child: Text("Email: ",
                            style: TextStyle(
                                color: Colors.black,
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
                          userDetails[0]['email'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
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
                          child: Text("Address: ",
                            style: TextStyle(
                                color: Colors.black,
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
                          userDetails[0]['address'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
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
                          child: Text("Paid For: ",
                            style: TextStyle(
                                color: Colors.black,
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
                          month.toString() + " month(s)",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
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
                          child: Text("Total Received: ",
                            style: TextStyle(
                                color: Colors.black,
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
                          price.toString() + " Taka",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
