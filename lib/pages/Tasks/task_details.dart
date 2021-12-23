import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isp_bill_collector/Formatters/mailFormatter.dart';
import 'package:isp_bill_collector/Formatters/nameFormatter.dart';
import 'package:isp_bill_collector/pages/Billing/bill_details.dart';
import 'package:isp_bill_collector/pages/Tasks/task_list.dart';

class TaskDetails extends StatefulWidget {
  List taskDetails;
  TaskDetails({Key? key, required this.taskDetails}) : super(key: key);

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Task Details'),
        backgroundColor: Colors.blue,
      ),
      body: CustomScrollView(
        slivers: [

          SliverList(delegate: SliverChildBuilderDelegate(
              (BuildContext context, index){
                return Column(
                  children: [
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
                                              nameShortener(widget.taskDetails[index]['first'], widget.taskDetails[index]['last']),
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
                                              mailShortener(widget.taskDetails[index]['email']),
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
                                              widget.taskDetails[index]['address'],
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
                                              widget.taskDetails[index]['created'],
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
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  BillDetails(billInfo: [widget.taskDetails[index]],)));
                          },
                          child: const Text(
                            "Pay Now"
                        )),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  TaskList()));
                          },
                          child: const Text(
                              "Extend For 5 Days"
                          ))
                      ],
                    )
                  ],
                );
              },
            childCount: 1,
            )
          )
        ],
      ),
    );
  }
}
