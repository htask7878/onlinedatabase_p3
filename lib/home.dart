import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'second.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  dynamic longitude = "Surat,Gujarat";
  List<bool> isselect = [true, false, false];
  List address_type = ["Home", "Office", "Other"];
  String add = "";
  Color c = Color(0xff4d4d4d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(right: 5, left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Ink(
                  child: Center(
                      child: Text(
                    "ADD ADDRESS",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff4d4d4d),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButton(
                  value: longitude,
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "Surat,Gujarat",
                      ),
                      value: "Surat,Gujarat",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Valsad,Gujarat",
                      ),
                      value: "Valsad,Gujarat",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Ahmadabad,Gujarat",
                      ),
                      value: "Ahmadabad,Gujarat",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Bhavnagar,Gujarat",
                      ),
                      value: "Bhavnagar,Gujarat",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Bharuch,Gujarat",
                      ),
                      value: "Bharuch,Gujarat",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Junagadh,Gujarat",
                      ),
                      value: "Junagadh,Gujarat",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Amreli,Gujarat",
                      ),
                      value: "Amreli,Gujarat",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Rajkot,Gujarat",
                      ),
                      value: "Rajkot,Gujarat",
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      longitude = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Text("Address Type:",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start),
                  // height: 20,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: ToggleButtons(
                      selectedBorderColor: c,
                      fillColor: c,
                      splashColor: Colors.purpleAccent,
                      selectedColor: Colors.white,
                      borderColor: c,
                      color: c,
                      onPressed: (newIndex) {
                        print(newIndex);
                        setState(() {
                          for (int index = 0;
                              index < isselect.length;
                              index++) {
                            if (index == newIndex) {
                              isselect[index] = true;
                              add = address_type[index];
                              print("$add");
                            } else {
                              isselect[index] = false;
                            }
                          }
                        });
                      },
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text("Home")),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text("Office")),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text("Other")),
                      ],
                      isSelected: isselect),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Text("Mobile No:",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start),
                  height: 20,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 10,
                ),
                Ink(
                    height: 40,
                    color: Color(0xffe9e9e9),
                    child: TextField(
                        controller: t1,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ))),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Text("Name : ",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start),
                  height: 20,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 10,
                ),
                Ink(
                    height: 40,
                    color: Color(0xffe9e9e9),
                    child: TextField(
                        controller: t2,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ))),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 45),
                        onPrimary: Colors.purpleAccent,
                        primary: Color(0xff4d4d4d)),
                    onPressed: () async {
                      String s1, s2, s3, s4;
                      s1 = longitude;
                      s2 = add;
                      s3 = t1.text;
                      s4 = t2.text;
                      print("s1 = $s1");
                      print("s2 = $s2");
                      print("s3 = $s3");
                      print("s4 = $s4");
                      var url = Uri.parse(
                          'https://pdfile7.000webhostapp.com/third/getedata3.php?longitude=$s1&address_type=$s2&mobile=$s3&name=$s4');
                      var response = await http.get(url);

                      print("statusCode =  ${response.statusCode}");
                      print("response =  ${response.body}");
                      longitude = "Surat,Gujarat";
                      isselect = [true,false,false];
                      t1.clear();
                      t2.clear();
                      setState(() {});
                    },
                    child: Text(
                      "submit",
                      style: TextStyle(
                          fontSize: 18, letterSpacing: 1, color: Colors.white),
                    )),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 45),
                        onPrimary: Colors.purpleAccent,
                        primary: Color(0xff4d4d4d)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return second();
                        },
                      ));
                    },
                    child: Text(
                      "View Data",
                      style: TextStyle(
                          fontSize: 18, letterSpacing: 1, color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
