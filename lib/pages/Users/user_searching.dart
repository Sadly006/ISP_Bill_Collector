import 'package:flutter/material.dart';

class UserSearch extends StatefulWidget {
  const UserSearch({Key? key}) : super(key: key);

  @override
  _UserSearchState createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {

  String zone = 'Zone';
  String subZone = 'Sub Zone';
  String box = 'Box';
  String clientType = 'Client Type';
  String activeStat = 'Active Status';

  var zoneList = ['Zone', 'Mirpur','Uttara', 'Farmgate', 'Gulshan'];
  var subZoneList = ['Sub Zone'];
  var boxList = ['Box', '1', '2', '3', '4'];
  var clientTypeList = ['Client Type', 'Home', 'Corporate', 'Gamer'];
  var activeStatList = ['Active Status', 'Active', 'Inactive'];
  subZoneSelector(String zone) {
      if(zone=='Mirpur'){
        subZoneList = ['Sub Zone', 'Mirpur1', 'Mirpur2', 'Mirpur3', 'Mirpur4'];
      }
      else if(zone=='Uttara'){
        subZoneList = ['Sub Zone', 'Uttara1', 'Uttara2', 'Uttara3', 'Uttara4'];
      }
      else if(zone=='Farmgate'){
        subZoneList = ['Sub Zone', 'Green Road', 'Indira Road', 'Panthapath'];
      }
      else if(zone=='Gulshan'){
        subZoneList = ['Sub Zone', 'Gulshan1', 'Gulshan2', 'Gulshan3', 'Gulshan4'];
      }
      else if(zone=='Vanish'){
        subZoneList = ['Sub Zone', 'Mirpur1', 'Mirpur2', 'Mirpur3', 'Mirpur4', 'Uttara1', 'Uttara2', 'Uttara3', 'Uttara4', 'Green Road', 'Indira Road', 'Panthapath', 'Gulshan1', 'Gulshan2', 'Gulshan3', 'Gulshan4'];
      }
      else if(zone=='Sub Zone'){
        subZoneList = ['Sub Zone'];
      }
  }
  @override
  void initState(){
    super.initState();
    subZoneSelector(zone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Search-The Khoj"),
      ),
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: DropdownButton(
                            elevation: 12,
                            dropdownColor: Colors.grey,
                            value: zone,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: zoneList
                                .map<DropdownMenuItem<String>>((String zone) {
                              return DropdownMenuItem<String>(
                                value: zone,
                                child: Text(zone),
                              );
                            }).toList(),
                            onChanged: (String? newZone){
                              setState(() {
                                zone = newZone!;
                                subZoneSelector('Vanish');
                                subZoneSelector(zone);
                                subZone = 'Sub Zone';
                              });
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: DropdownButton(
                            elevation: 12,
                            dropdownColor: Colors.grey,
                            value: subZone,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: subZoneList
                                .map<DropdownMenuItem<String>>((String subZone) {
                              return DropdownMenuItem<String>(
                                value: subZone,
                                child: Text(subZone),
                              );
                            }).toList(),
                            onChanged: (String? newSubZone){
                              setState(() {
                                subZone = newSubZone!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownButton(
                            elevation: 12,
                            dropdownColor: Colors.grey,
                            value: box,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: boxList
                                .map<DropdownMenuItem<String>>((String box) {
                              return DropdownMenuItem<String>(
                                value: box,
                                child: Text(box),
                              );
                            }).toList(),
                            onChanged: (String? newBox){
                              setState(() {
                                box = newBox!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownButton(
                            elevation: 12,
                            dropdownColor: Colors.grey,
                            value: clientType,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: clientTypeList
                                .map<DropdownMenuItem<String>>((String clientType) {
                              return DropdownMenuItem<String>(
                                value: clientType,
                                child: Text(clientType),
                              );
                            }).toList(),
                            onChanged: (String? newClientType){
                              setState(() {
                                clientType = newClientType!;
                              });
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownButton(
                            elevation: 12,
                            dropdownColor: Colors.grey,
                            value: activeStat,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: activeStatList
                                .map<DropdownMenuItem<String>>((String activeStat) {
                              return DropdownMenuItem<String>(
                                value: activeStat,
                                child: Text(activeStat),
                              );
                            }).toList(),
                            onChanged: (String? newActiveStat){
                              setState(() {
                                activeStat = newActiveStat!;
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
      ),
    );
  }
}
