import 'package:flutter/material.dart';
import 'package:isp_bill_collector/Screen%20Sizes/screen_size_page.dart';
import 'package:isp_bill_collector/pages/Billing/payment_complete.dart';

class BillDetails extends StatefulWidget {
  List billInfo;
  BillDetails({Key? key, required this.billInfo}) : super(key: key);

  @override
  _BillDetailsState createState() => _BillDetailsState();
}

class _BillDetailsState extends State<BillDetails> {
  var payMethodList = ['Select', 'Cash', 'Bkash', 'Nagad', 'Rocket', 'Debit/Credit'];
  var payMethod = 'Select';
  var price = 1250;
  var month = 1;

  _getMonth(month){
    return month.toString();
  }

  _getBill(price, month){
    return (price*month).toString();
  }

  _navigator(String payMethod){
    if(payMethod=='Select'){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text("Select a Payment Method"),
      ));
    }
    else{
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>  PaymentComplete(userDetails: [widget.billInfo[0]], price: price, month: month,)));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.white70,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                background: Image.asset("assets/logo.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, index){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.all(10)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  widget.billInfo[index]['first'] + " " + widget.billInfo[index]['last'],
                                  style: const TextStyle(
                                      fontSize: 15
                                  ),
                                ),
                              ),
                            ]
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "20MBPS Gaming Package",
                                  style: TextStyle(
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  (_getBill(price, month)) + " taka",
                                  style: const TextStyle(
                                      fontSize: 20
                                  ),
                                ),
                              ),
                            ]
                        ),
                        const Padding(padding: EdgeInsets.all(5)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Payment Method",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: DropdownButton(
                                elevation: 12,
                                dropdownColor: Colors.grey,
                                value: payMethod,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: payMethodList
                                    .map<DropdownMenuItem<String>>((String payMethod) {
                                  return DropdownMenuItem<String>(
                                    value: payMethod,
                                    child: Text(payMethod),
                                  );
                                }).toList(),
                                onChanged: (String? newPayMethod){
                                  setState(() {
                                    payMethod = newPayMethod!;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                );
              },
              childCount: 1,
            )),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              month == 1
                                ? month = 1
                                : month--;
                              setState(() {
                                _getMonth(month);
                                _getBill(price, month);
                              });
                            },
                            child: const Text(
                              "-",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              elevation: 66,
                              shadowColor: Colors.black54
                            ),
                          ),
                          Text(
                            _getMonth(month),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              month++;
                              setState(() {
                                _getMonth(month);
                                _getBill(price, month);
                              });
                            },
                            child: const Text(
                              "+",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: displayWidth(context)*0.55,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (payMethod=='Select') {
                                  return Colors.grey;
                                }
                                return Colors.blue;
                              },
                            ),
                          ),
                          onPressed: () {
                            _navigator(payMethod);
                          },
                          child: const Text(
                              "Confirm Payment"
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
