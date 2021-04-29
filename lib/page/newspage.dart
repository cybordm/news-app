import 'package:flutter/material.dart';
import 'package:newsapp/model/newsdata.dart';
import 'package:newsapp/service/news.dart';
class newsPage extends StatefulWidget {
  @override
  _newsPageState createState() => _newsPageState();
}

class _newsPageState extends State<newsPage> {
  List<newsData>newsList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Container(
   child: FutureBuilder(
  future: getNewsList('trending'),
  builder: (context,snapshot){
   if(snapshot.hasData){
       if(newsList.length==0){
         return Center(child: Text('no News found'),);
       }else{
         return ListView.builder(
           itemCount: newsList.length,
           itemBuilder:(context,index){
           return ListTile(
             title: Text(newsList[index].title),
           );
         },);
       }}else if(snapshot.hasError){
   return Center(child: Text('${snapshot.error}'));
   }else{
       return Center(child: CircularProgressIndicator(),);
   }
  },

),
      ),
    );
  }

  getNewsList(String s)async {
    newsList=await news().getNewsList(s);
    return newsList;
  }
}
