import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  PageController controller = PageController();
  int currentPage = 1;
  List <Widget> list = [];




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: PageView.builder(
            controller: controller,
            itemCount: list.length,
            onPageChanged: (value){
              currentPage = value;
            },
            itemBuilder: (context, index){
          return list.isEmpty ? Text("data") : list[currentPage-1];
        }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        ]),
      ),
    );
  }
}
