import 'package:flutter/gestures.dart';
import'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
String title;
String image;
var description;
var source;

  Details({required this.title,required this.description,required this.image,required this.source}) ;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var linktext=TextStyle(color:Colors.blue);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
appBar: AppBar(backgroundColor: Colors.white12,title: Text('Details..'),),
body: ListView(
  //crossAxisAlignment: CrossAxisAlignment.start,

  children: [
Image.network(widget.image),
Text(widget.title,style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),),
Expanded(child: Text('details:'))
       , Expanded(child: Text(
        widget.description
        )),
      //  Text(widget.source),

RichText(
text:TextSpan(
  children: [
TextSpan(
style:linktext,
text:"click here",
recognizer: TapGestureRecognizer(

)..onTap=()async{
var url=
widget.source;
if(!await canLaunch(url)){
 
  await launch(url);


}else{


  throw("cannot load url$url");
}

}
)
  ],

)

)
   

            

  ],
),
    );
  }
}