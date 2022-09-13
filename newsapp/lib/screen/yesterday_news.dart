import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/model/model.dart';
import 'package:newsapp/provider/api_manager.dart';
import 'package:newsapp/screen/details.dart';
import 'package:provider/provider.dart';

class Yesterday extends StatefulWidget {
// var title;
// var image;
// var content;

 // Yesterday({required this.title,required this.content,required this.image}) ;

  @override
  State<Yesterday> createState() => _TodayState();
}

class _TodayState extends State<Yesterday> {

   Future<Welcome> ?_newsModel;
@override
  void initState() {
_newsModel = API_Manager().getNews();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

//DateTime now = DateTime.now();
//DateTime yesterday= DateTime.now().subtract(Duration(days: 1));
//var formatter = new DateFormat('yyyy-MM-dd');
// String formattedDate = formatter.format(yesterday);
//new DateTime.now();
// var date=DateFormat(
//   ' y-M-d'
  
//  // 'dd MMM - HH:mm'

// )
//                               .format(now);

   return Scaffold(
body: Consumer<API_Manager>(builder:
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

                          var filter
                         // article 
                          = snapshot.data!.articles[index];
//var filter;
var date1=DateFormat(
 "yyyy-MM-dd"
 //' y-M-d'
//'dd MMM - HH:mm'
) .format(
  filter
  //article

.publishedAt);
String no = DateFormat(
  "yyyy-MM-dd"
  //'dd MMM - HH:mm'
  //"yyyy-MM-dd"
).format(DateTime.now().subtract(Duration(days: 1)));
print('date1');
         print(date1);
                   print('now');
print(no);


   // var formatter = new DateFormat('y-M-d');
   // String formattedDate = formatter.format(now);
    //print(formattedDate);

                 //  print(nowdate);

                           var formattedTime = DateFormat(
                             'dd MMM - HH:mm'
                            ) .format(
                              filter
                              //article
                            .publishedAt);
DateTime dt1 = DateTime.parse(//date1
no
  //"2021-12-23 11:47:00"
);
DateTime dt2 = DateTime.parse(
  //date1
  no
  //"2021-12-23 11:47:00"
  );

if(dt1.compareTo(dt2) == 0){
    print("Both date time are at same moment.");
}



                         if(date1==no){
                          print('wowowowowowowowowo');
                         }
                         else{
                          print('oops sorry');
                         }
                    //      if(date1==now){
                    //       filter=snapshot.data!.articles[index];
                    //       print('value xa..');
                    //      }
                    //      else {
                    //       print('value not exist');
                    //      }
                    //   else{
                    // return Text('loading.....');
                    //  }
                      //  return Text('data');
                    
                    return 
                    
                    
                    
                    date1==no? InkWell(onTap: (){
                      
                       // print(formattedTime);
                      
                         },
                           child: Column(
                           children: [
    
    
    
    
                                /////////////////////////////////////////////////////
                              Container(
                                   child: Container(
                                     height: 150,
                                    margin: const EdgeInsets.all(8),
                                     child: MaterialButton(onPressed: (){
                                       Navigator.push(context, MaterialPageRoute(builder:(context)=>Details(source: filter.url,title: filter.title,description: filter.content,
                                        image: filter.urlToImage
                                        ,)
                                      
                                      )
                                       );
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
                                                  filter.urlToImage,
                                                  fit: BoxFit.cover,
                                                )
                                                ),
                                          ),
                                          SizedBox(width: 16),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(formattedTime),
                                                Text(
                                                  filter.title,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  filter.description,
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
                          ):Container();
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
   );
    
  }
}