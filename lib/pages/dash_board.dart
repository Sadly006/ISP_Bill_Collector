import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isp_bill_collector/Constants/constant.dart';
import 'package:isp_bill_collector/Screen%20Sizes/screen_size_page.dart';
import 'package:isp_bill_collector/pages/Tasks/task_list.dart';
import 'package:isp_bill_collector/pages/Users/user_list.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(title: 'Billing List', key: key,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  Map<String, double> dataMap = {
    "Timely Collected": 250,
    "Due": 30,
    "Late Collection": 75,
    "Failed": 10,
  };

  List<Color> colorList = [
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.red,
  ];


  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _sideMenuKey,
      menu: buildMenu(),
      type: SideMenuType.slideNRotate,
      radius: BorderRadius.circular(5),
      background: null,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              final _state = _sideMenuKey.currentState;
              if (_state!.isOpened) {
                _state.closeSideMenu();
              } else {
                _state.openSideMenu();
              }
            },
          ),

          title: Text(widget.title),
        ),
        body: Container(
          height: displayHeight(context) * 1,
          width: displayWidth(context) * 1,
          child: CustomScrollView(
            key: _key,
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: displayHeight(context) * 0.15,
                      color: Colors.white,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 10),
                            child: Card(
                              color: Colors.blueGrey,
                              elevation: 6,
                              shadowColor: ShadowColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      "assets/users.png",
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 8, left: 8.0),
                                        child: Text(
                                          // AppLocalizations.of(context).order,
                                          "Users",
                                          style: HomePageCardText,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0, left: 8),
                                        child: Text(
                                          "500",
                                          style: HomePageCardText,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: 2,
                                            width: 200,
                                            color: Colors.blue
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 02.0, left: 10),
                                        child: Text(
                                          "Total Users",
                                          style: HomePageCardText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 10),
                            child: Card(
                              color: Colors.blueGrey,
                              elevation: 6,
                              shadowColor: ShadowColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlueAccent,
                                        borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      "assets/unpaid.png",
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 8.0),
                                        child: Text(
                                          "Unpaid Users",
                                          style: HomePageCardText,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 8),
                                        child: Text(
                                          "250",
                                          style: HomePageCardText,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: 2,
                                            width: 200,
                                            color: Colors.blue
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 02.0, left: 10),
                                        child: Text(
                                          "Total Unpaid Users",
                                          style: HomePageCardText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 10),
                            child: Card(
                              color: Colors.blueGrey,
                              elevation: 6,
                              shadowColor: ShadowColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      "assets/paid.png",
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 8.0),
                                        child: Text(
                                          "Paid Users",
                                          style: HomePageCardText,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 8),
                                        child: Text(
                                          "Paid Users",
                                          style: HomePageCardText,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: 2,
                                            width: 200,
                                          color: Colors.blue
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 02.0, left: 10),
                                        child: Text(
                                          "Total Paid",
                                          style: HomePageCardText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 10),
                            child: Card(
                              color: Colors.blueGrey,
                              elevation: 6,
                              shadowColor: ShadowColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      "assets/expire.png",
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 8, left: 8.0),
                                        child: Text(
                                          "Expire",
                                          style: HomePageCardText,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0, left: 8),
                                        child: Text(
                                          "Expire",
                                          style: HomePageCardText,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: 2,
                                            width: 200,
                                            color: Colors.blue,
                                        )
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 02.0, left: 10),
                                        child: Text(
                                          "Expire",
                                          style: HomePageCardText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),


                        ]
                      )
                    ),


                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: GestureDetector(
                        child: Container(
                          height: displayHeight(context) * 0.15,
                          child: const Card(
                            color: Colors.lightGreenAccent,
                            elevation: 6,
                            child: Center(
                              child: Text(
                                "Today's Task",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TaskList()
                              )
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Container(
                        child: Center(
                          child: PieChart(
                            dataMap: dataMap,
                            animationDuration: Duration(milliseconds: 800),
                            chartLegendSpacing: 32,
                            chartRadius: MediaQuery.of(context).size.width / 3.2,
                            colorList: colorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            ringStrokeWidth: 32,
                            legendOptions: const LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.right,
                              showLegends: true,
                              legendTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 1,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                 )
                ),
              ]
            ),
          )
        )
      );
    }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: ClipOval(
                          child: Image.asset(
                            "assets/avatar2.jpg",
                            height: displayHeight(context) * 0.2,
                            width: displayWidth(context) * 0.2,
                            fit: BoxFit.cover,
                          )),
                      radius: 40,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(height: 16.0),
                    const Padding(padding: EdgeInsets.only(left: 0),
                      child: Text(
                        "User Name",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ],
            )
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/users.png",
                fit: BoxFit.cover,
                height: 30,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  "User List",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500))),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserList()));
            },
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/paid.png",
                fit: BoxFit.cover,
                height: 30,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  "Paid Users",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500))),
            ),
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/unpaid.png",
                fit: BoxFit.cover,
                height: 30,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  "Unpaid Users",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500))),
            ),
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/avatar2.jpg",
                fit: BoxFit.cover,
                height: 30,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  "User List",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500))),
            ),
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/avatar2.jpg",
                fit: BoxFit.cover,
                height: 30,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  "User List",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500))),
            ),
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/record.png",
                fit: BoxFit.cover,
                height: 30,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                      "Task Record",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500))),
                  PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("Daily"),
                        ),
                        PopupMenuItem(
                          child: Text("Weekly"),
                        ),
                        PopupMenuItem(
                          child: Text("Monthly"),
                        ),
                        PopupMenuItem(
                          child: Text("Yearly"),
                        ),
                      ]
                  ),
                ],
              ),
            ),
            // onTap: () {
            //
            //   // Navigator.push(
            //   //     context,
            //   //     MaterialPageRoute(
            //   //         builder: (context) =>  Records()));
            // },
          ),

        ],
      ),
    );
  }
}