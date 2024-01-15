import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'MyAb.dart';
import 'DialogBox.dart';

void main(){
  runApp( const MyUi());
}

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
          const PreferredSize(preferredSize: Size.fromHeight(80), child: MyAppBar()),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
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
                        color: const Color(0xffFFFFFF),
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
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  myProductList[index]["Name"],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Color: ",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                    Text(
                                      myProductList[index]["Color"].toString(),
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      "Size: ",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                    Text(
                                        myProductList[index]["Size"].toString(),
                                        style: const TextStyle(fontSize: 13)),
                                  ],
                                ),
                                const SizedBox(
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
                                        padding: const EdgeInsets.all(6),
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
                                        child: const Icon(CupertinoIcons.minus),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      myProductList[index]["quantity"]
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
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
                                              return const MyDialogBox();
                                            },
                                          );
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
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
                                        child: const Icon(CupertinoIcons.add),
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
                              const Icon(Icons.more_vert, color: Color(0xff9B9B9B)),
                              const SizedBox(
                                height: 45,
                              ),
                              Text(
                                "${myProductList[index]["Price"] * myProductList[index]["quantity"]}\$",
                                style: const TextStyle(
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
                  const Text(
                    "Total amount:",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "$TotalTaka\$",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    MySnackber(context, "Sorry check out not available");
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                      backgroundColor: const Color(0xffDB3022),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                  child: const Text('CHECK OUT')),
            ],
          ),
        ),
      ),
    );
  }
}
