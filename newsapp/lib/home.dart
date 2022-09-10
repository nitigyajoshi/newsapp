import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:intl/intl.dart';
import 'package:newsapp/api_manager.dart';
import 'package:newsapp/details.dart';
import 'package:newsapp/model.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Welcome> ?_newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(color: Colors.pinkAccent,
        child: Row(children: [
          Divider(),
          Container(height: 60,width: 53,child:
           MaterialButton(child: Icon(Icons.home,color: Colors.blueAccent,),shape:Border.all(style: BorderStyle.solid) ,onPressed: (){


          }),),
SizedBox(width: 35,),

Container(height: 50,width: 53,child: MaterialButton(child: Icon(Icons.sports_basketball,color: Colors.white,),shape:Border.all(style: BorderStyle.solid) ,onPressed: (){


          }),),
          SizedBox(width: 35,),

          Container(height: 50,width: 53,
          child: MaterialButton(child: Icon(Icons.sunny,color: Colors.yellowAccent,),
          shape:Border.all(style: BorderStyle.solid) ,onPressed: (){


          }),),


        ],),
      ),
       appBar: AppBar(leading: IconButton(onPressed: (){
setState(() {
  API_Manager().getNews();
});

       }, icon: Icon(Icons.refresh)),backgroundColor: Colors.deepPurpleAccent,
         title: Text('News App'),
       ),
      body: Column(
        children: [
          CarouselSlider(
            items: items.map((item) {
            return Builder(builder: (BuildContext context){

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
Text(
  articl.title,
  
),
Text(articl.description)
],




   ));
 },


);
}
else{
  return Text('loading.....');
}

});
            });
          })
          .toList(), 
          options:CarouselOptions(
            autoPlay: true,
            height: 200,
               enableInfiniteScroll = true,

            ) 
            ),
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
                        var article = snapshot.data!.articles[index];
                        var formattedTime = DateFormat('dd MMM - HH:mm')
                            .format(article.publishedAt);
                        return InkWell(onTap: (){
                     
                        },
                          child: Container(
                            height: 100,
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
                        );
                      });
                    
                } else
                  return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
  final List items=[Colors.orange,Colors.yellow,Colors.accents,Colors.amber];
}