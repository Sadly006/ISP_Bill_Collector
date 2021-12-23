import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isp_bill_collector/Formatters/mailFormatter.dart';
import 'package:isp_bill_collector/Formatters/nameFormatter.dart';
import 'package:isp_bill_collector/Screen%20Sizes/screen_size_page.dart';
import 'package:isp_bill_collector/pages/Users/user_searching.dart';
import 'package:isp_bill_collector/pages/Users/user_datails.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  var _isLoading = true;
  List userList = [];

  Future _getUsers() async{
    var response = await http.get(
        Uri.parse("https://randomapi.com/api/6de6abfedb24f889e0b5f675edc50deb?fmt=raw&sole")
    );
    if(response.statusCode==200){
      userList = json.decode(response.body);
      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  void initState(){
    super.initState();
    _getUsers();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: _isLoading
          ? Container(
          color: Colors.white,
          child: Center(
            child: Image.asset("assets/loader.gif"),
          ))

          : Container(
              height: displayHeight(context) * 1,
              width: displayWidth(context) * 1,
              color: Colors.black12,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    snap: true,
                    floating: true,
                    backgroundColor: Colors.blue,
                    expandedHeight: 160.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:const [
                              Text("All Users"),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>  UserSearch())
                                    );
                                  }
                                ),
                            ],
                          )
                        ],
                      ),
                      background: Image.asset("assets/userBg.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, index) {
                          return Column(
                            children: [
                              const Padding(padding: EdgeInsets.all(0)),
                              _isLoading
                                ? Container(
                                    color: Colors.white70,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Image.asset("assets/loader.gif"),
                                        ],
                                      ),
                                    ),
                                  )
                                : userList.isEmpty
                                ? const Center(
                                    child: Text("No Users In The Area :("),
                                )
                                :ListTile(
                                  title: GestureDetector(
                                    onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>  UserDetails(userDetails: [userList[index]],))),
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      color: Colors.white,
                                      elevation: 50,
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                  height: 80,
                                                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    child: Image.asset("assets/users.png"),
                                                  )
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          nameShortener(userList[index]['first'].toString(), userList[index]["last"].toString()),
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          mailShortener(userList[index]['email'].toString()),
                                                          style: const TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black45,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                  ),
                              )
                            ),
                          ],
                        );
                      },
                      childCount: userList.length,
                    )
                  ),
                ],
              ),
      ),
    );
  }
}
