import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlinedatabase_p3/customer.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  List map = [];
  Color c = Color(0xff4d4d4d);

  // customer cu = customer();

  Future viewdata() async {
    var url =
        Uri.parse('https://pdfile7.000webhostapp.com/third/viewdata3.php');
    var response = await http.get(url);
    print("response = ${response.body}");
    print("statusecode = ${response.statusCode}");
    map = jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      strokeWidth: 2,
      color: c,
      backgroundColor: Colors.transparent,
      onRefresh: () {
        return refresh();
        setState(() {});
      },
      child: Scaffold(
        backgroundColor: Color(0xffd9d9d9),
        body: SafeArea(
          top: true,
          child: Container(
            margin: EdgeInsets.only(right: 6, left: 6),
            child: Column(
              children: [
                Ink(
                  child: Center(
                      child: Text(
                    "ALL CATEGORY",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff4d4d4d),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: viewdata(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                customer cu = customer.fromJson(map[index]);
                                return Container(
                                  margin: EdgeInsets.only(top: 9, bottom: 9),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                  child: ListTile(
                                      trailing: IconButton(
                                          onPressed: () async {
                                            var url = Uri.parse(
                                                'https://pdfile7.000webhostapp.com/third/deletedata3.php?id=${cu.id}');
                                            var response = await http.get(url);
                                            print("response = ${response.body}");
                                            print("status code = ${response.statusCode}");
                                          },
                                          icon: Icon(Icons.delete)),
                                      subtitle: Column(
                                        children: [
                                          Text(
                                              "name: ${cu.name}, MobileNo: ${cu.mobile}, add_type: ${cu.addressType}, City: ${cu.longitude}"),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  fixedSize: Size(120, 30),
                                                  onPrimary: Colors.purpleAccent,
                                                  primary: Color(0xff4d4d4d)),
                                              onPressed: () {},
                                              child: Text(
                                                "Update",
                                                style: TextStyle(
                                                    fontSize: 15, letterSpacing: 1, color: Colors.white),
                                              )),
                                        ],
                                      ),
                                      title: Text(
                                        "Address : ${cu.id}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      )),
                                );
                              },
                              itemCount: map.length),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future refresh() async {
    await Duration(seconds: 2);
  }
}
