import 'package:flutter/material.dart';

class Records extends StatefulWidget {
  const Records({Key? key}) : super(key: key);

  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {

  String records = 'Time Span';

  var timeSpans = ['Time Span', 'Daily','Weekly', 'Monthly', 'Yearly'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Task Records"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: DropdownButton(
                          elevation: 12,
                          dropdownColor: Colors.grey,
                          value: records,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: timeSpans
                              .map<DropdownMenuItem<String>>((String records) {
                            return DropdownMenuItem<String>(
                              value: records,
                              child: Text(records),
                            );
                          }).toList(),
                          onChanged: (String? newSpan){
                            setState(() {
                              records = newSpan!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Center(
                  child: SizedBox(
                      width: 100,
                      height: 50,
                      child: Card(
                        color: Colors.lightGreenAccent,
                        child: Center(
                          child: GestureDetector(
                            child: Row(
                              children: [
                                Icon(Icons.search),
                                Text("Search"),
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                ),
              ]
              )
          )
        ],
      ),
    );
  }
}
