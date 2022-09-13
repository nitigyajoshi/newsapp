//flutter run --no-sound-null-safety

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:intl/intl.dart';
import 'package:newsapp/provider/api_manager.dart';
import 'package:newsapp/screen/details.dart';
import 'package:newsapp/model/model.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/screen/yesterday_news.dart';
import 'package:newsapp/widget/tabbar.dart';
import 'package:provider/provider.dart';
import 'package:widget_slider/widget_slider.dart';
List<String>?title;
List<String>?content;
List<String>?image;
int i=1;
var a,b,c;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Welcome> ?_newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
   // slide();
    super.initState();
  }
Widget slide(){
  return FutureBuilder<Welcome>(


  future: _newsModel,builder: (context,snapshot){


if(snapshot.hasData){
  return ListView.builder(  itemCount: snapshot.data!.articles.length,
  

 itemBuilder: (context,position){
     var articl = snapshot.data!.articles[position];
   return Card(


child: Stack(
children: [
   AspectRatio(
 aspectRatio: 1,
     child: Image.network(
    articl.urlToImage,
     fit: BoxFit.cover,
                      )

),
Text(snapshot.data!.articles[position].title
  //articl.title,
  
),
Text(snapshot.data!.articles[position].description
  //articl.description
  )
],




   ));
 },


);
}
else{
  return Text('loading.....');
}

})
  ;
  /////////////////////////////////
}
  @override
  Widget build(BuildContext context) {

DateTime now = new DateTime.now();
var date=DateFormat(
  ' y-M-d'
  
  //'dd MMM - HH:mm'

)
                              .format(now);
print('/??????????????????????????????????/');
print(date);

//DateTime date = new DateTime(now.year, now.month, now.day);

    //=Provider.of<API_Manager>(context,listen: false);
    return DefaultTabController( length: 3,
      child: Scaffold(
        
   
    //      appBar: AppBar(backgroundColor: Colors.white10,bottom: ,
    // //      leading: IconButton(onPressed: (){
    // // setState(() {
    // //   API_Manager().getNews();
    // // });
    
    // //      }, icon: Icon(Icons.refresh)),backgroundColor: Colors.deepPurpleAccent,
    //        title: Text('News App'),
    //      ),
    
    
    
    
        body:Consumer<API_Manager>(builder:
         (context,data,child){
          
          data.getNews();
          
    return  Column(
          children: [
    //tab(),
      
      Divider(height: 2,color: Colors.black,),
  
           // ,
           Expanded(
              //height: 700,
              child: FutureBuilder<Welcome>(
                future: _newsModel,
    
                builder: (context, snapshot) {
                  if (snapshot.hasData) {



                    return ListView.builder(shrinkWrap: true,
                        itemCount: snapshot.data?.articles.length,
                        itemBuilder: (context, index) {
                          //if(now==snapshot.data.articles.)

                          var article = snapshot.data!.articles[index];

var date1=DateFormat(
  ' y-M-d'
  
  //'dd MMM - HH:mm'

)
                              .format(article.publishedAt);
                              if (date1==date) {
                               
                               print('yes');
                               a=snapshot.data!.articles[index].title;
                               b=snapshot.data!.articles[index].content;
                               c=snapshot.data!.articles[index].urlToImage;
                               //title?[index]=snapshot.data!.articles[index].title;
                              // title=snapshot.data!.articles[index].title;
                              //title?.insert(i,snapshot.data!.articles[index].title);
                              // title?.add(snapshot.data!.articles[index].title);
                              // print(title?[0]);
                              // i++;
                              // print(i);
                             // Today(title: title, content: content, image: image)

if(title==null){
  print('nullvalue');
}else{
  print('value exist');
}
                              }
                              else{
                               // print(article.title);
                              }
//date1==date
//if(article.publishedAt==date){
  //print('title:');
  //print(title![index]);
 // }

                          var formattedTime = DateFormat(
                            'dd MMM - HH:mm'
                            )
                              .format(article.publishedAt);
                          return InkWell(onTap: (){
                      
                      //  print(formattedTime);
                      
                          },
                            child: Column(
                              children: [
    
    
    
    
                                /////////////////////////////////////////////////////
                                Container(
                                  child: Container(
                                    height: 150,
                                    margin: const EdgeInsets.all(8),
                                    child: MaterialButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder:(context)=>Details(source: article.url,title: article.title,description: article.content,image: article.urlToImage,)));
                                    },
                                      child: Row(
                                        children: <Widget>[
                                          Card(
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(24),
                                            ),
                                            child: AspectRatio(
                                                aspectRatio: 1,
                                                child: Image.network(
                                                  article.urlToImage,
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          SizedBox(width: 16),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(formattedTime),
                                                Text(
                                                  article.title,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  article.description,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                      
                  } else
                    return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        );
    
    
    
    
    
    ///########################################
        })
      ),
    );
  }
  final List items=[Colors.orange,Colors.yellow,Colors.accents,Colors.amber];
}