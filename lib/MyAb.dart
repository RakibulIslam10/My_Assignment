import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      toolbarHeight: 70,
      actions: [
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.black,size: 28,)),
        ),
      ],
    );
  }
}
