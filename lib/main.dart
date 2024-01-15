import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'MyAb.dart';
import 'DialogBox.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyUi(), // Wrap your app
      ),
    );

class MyUi extends StatelessWidget {
  const MyUi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MySnackber(context, String msg) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$msg"),
        backgroundColor: Colors.pink,
      ),
    );
  }

  List myProductList = [
    {
      "Name": "Pullover",
      "Color": "Black",
      "Size": "L",
      "Price": 51,
      "quantity": 1,
      "Image": "images/1img.png"
    },
    {
      "Name": "T-Shirt",
      "Color": "Gray",
      "Size": "L",
      "Price": 30,
      "quantity": 1,
      "Image": "images/2img.png"
    },
    {
      "Name": "Sport Dress",
      "Color": "Black",
      "Size": "M",
      "Price": 43,
      "quantity": 1,
      "Image": "images/3img.png"
    },
  ];

  int get TotalTaka {
    return myProductList.fold<int>(
        0,
        (total, product) =>
            total + product['Price'] * product["quantity"] as int);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(80), child: MyAppBar()),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "My Bag",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: myProductList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 25)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              myProductList[index]["Image"],
                              height: 120,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  myProductList[index]["Name"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Color: ",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                    Text(
                                      myProductList[index]["Color"].toString(),
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Size: ",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                    Text(
                                        myProductList[index]["Size"].toString(),
                                        style: TextStyle(fontSize: 13)),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (myProductList[index]["quantity"] >
                                            1) {
                                          setState(() {
                                            myProductList[index]["quantity"] -=
                                                1;
                                          });
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 0,
                                                  blurRadius: 5)
                                            ]),
                                        child: Icon(CupertinoIcons.minus),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      myProductList[index]["quantity"]
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          myProductList[index]["quantity"] += 1;
                                        });
                                        if (myProductList[index]["quantity"] ==
                                            5) {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return MyDialogBox();
                                            },
                                          );
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 0,
                                                  blurRadius: 5)
                                            ]),
                                        child: Icon(CupertinoIcons.add),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.more_vert, color: Color(0xff9B9B9B)),
                              SizedBox(
                                height: 45,
                              ),
                              Text(
                                "${myProductList[index]["Price"] * myProductList[index]["quantity"]}\$",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total amount:",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "$TotalTaka\$",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    MySnackber(context, "We sorry check out no abalable");
                  },
                  child: Text('CHECK OUT'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 56),
                      backgroundColor: Color(0xffDB3022),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
