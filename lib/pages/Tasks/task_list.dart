import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isp_bill_collector/Formatters/mailFormatter.dart';
import 'package:isp_bill_collector/Formatters/nameFormatter.dart';
import 'package:isp_bill_collector/Screen%20Sizes/screen_size_page.dart';
import 'package:isp_bill_collector/pages/Tasks/task_details.dart';
import 'package:isp_bill_collector/pages/Users/user_searching.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  var _isLoading = true;
  List taskList = [];

  Future _getUsers() async{
    var response = await http.get(
        Uri.parse("https://randomapi.com/api/6de6abfedb24f889e0b5f675edc50deb?fmt=raw&sole")
    );
    if(response.statusCode==200){
      taskList = json.decode(response.body);
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
                    expandedHeight: 160.0,
                    backgroundColor: Colors.blue,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:const [
                              Text("Task List"),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: displayHeight(context) * 0.021,
                              ),
                              IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    size: 22,
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
                                : taskList.isEmpty
                                ? const Center(
                                    child: Text("No Task Today :)"),
                                )
                                :ListTile(
                                  title: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>  TaskDetails(taskDetails: [taskList[index]],)
                                        )
                                      ),
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
                                                          nameShortener(taskList[index]['first'].toString(), taskList[index]["last"].toString()),
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
                                                          taskList[index]['balance'].toString(),
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
                        childCount: taskList.length,
                      )
                  ),
                ],
              ),
      ),
    );
  }
}
