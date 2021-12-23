import 'package:flutter/material.dart';
import 'package:isp_bill_collector/Confirmation%20Mailing/mail.dart';
import 'package:isp_bill_collector/PDF%20Generator/invoice_generator.dart';
import 'package:isp_bill_collector/Screen%20Sizes/screen_size_page.dart';

class PaymentComplete extends StatelessWidget {
  List userDetails;
  var month;
  var price;
  PaymentComplete({Key? key, required this.userDetails, required this.month, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.blue,
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text("User Details",
              //   style: TextStyle(
              //     color: Colors.blue,
              //   ),
              // ),
              title: Text(
                "Payment Successfull!!",
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, index){
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10)),
                    Container(
                      height: displayHeight(context) * 0.5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: displayHeight(context) * 0.1,
                            child: GestureDetector(
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Card(
                                  elevation: 6,
                                  color: Colors.white70,
                                  child: Center(
                                    child: Text(
                                      "Generate Invoice",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  Invoice(userDetails: [userDetails[index]], price: price, month: month,)));
                              },
                            ),
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.1,
                            child: GestureDetector(
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Card(
                                  elevation: 6,
                                  color: Colors.white70,
                                  child: Center(
                                    child: Text(
                                      "Send Email",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  Mail()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              childCount: 1,
            )
          ),
        ],
      ),
    );
  }
}
