import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screen/home.dart';
import 'package:newsapp/screen/today_news.dart';
import 'package:newsapp/screen/yesterday_news.dart';

class tab extends StatefulWidget {
  @override
  State<tab> createState() => _tabState();
}

class _tabState extends State<tab> with TickerProviderStateMixin {
TabController ?_controller;

 @override
 void initState() {
    _controller = TabController(
      initialIndex: 0,
      length: 3,
      //vsync: this,
      vsync: this
    );

   //super.initState();
   
 }

  @override
  Widget build(BuildContext context) {
    
 return Container(
   child: Scaffold(
appBar: AppBar(title: Text('NewsApp'),backgroundColor: Colors.white10,
bottom: TabBar(
  controller: _controller
  ,tabs: [

       Tab(text: 'All',),
  
              //Tab(icon: Icon(Icons.trending_down)),
  
              Tab(text: 'Yesterday',),
  
      Tab(text: 'Today',)
  
           ]
  
           
  
           ),

),
    body: TabBarView(
      controller: _controller,
      children: [

 Container(
  child: HomePage(),
             // color: Colors.red,
            ), 
            Container(
  child: Yesterday(),
           //   color: Colors.red,
            ),

             Container(
               child: Today(),
            ),



    ]),
   ),
 );
  }
}