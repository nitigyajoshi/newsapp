import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/model/model.dart';
import 'package:newsapp/provider/api_manager.dart';
import 'package:newsapp/screen/details.dart';
import 'package:provider/provider.dart';

class Today extends StatefulWidget {


  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {

   Future<Welcome> ?_newsModel;
@override
  void initState() {
_newsModel = API_Manager().getNews();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

                 

   return Scaffold(
body: Consumer<API_Manager>(builder:
         (context,data,child){
          
          data.getNews();
          
    return  Column(
          children: [
    
      
      Divider(height: 2,color: Colors.black,),
  
           // ,
           Expanded(
            
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
  filter.publishedAt);
String no = DateFormat(
  "yyyy-MM-dd"
  //'dd MMM - HH:mm'
  //"yyyy-MM-dd"
).format(DateTime.now());
print('date1');
         print(date1);
                   print('now1');
print(DateTime.now());


 

                           var formattedTime = DateFormat(
                             'dd MMM - HH:mm'
                            ) .format(
                              filter
                              //article
                            .publishedAt);



                         
                    
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
                                                // child: Image.network(
                                                //   filter.urlToImage,
                                                //   fit: BoxFit.cover,
                                                // )
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