import 'package:flutter/material.dart';
import 'package:news_snack/controller/fetchNews.dart';
import 'package:news_snack/model/newsArt.dart';
import 'package:news_snack/view/widgets/NewsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 late NewsArt newsArt;


  GetNews()async{
    newsArt=await FetchNews.fetchNews();
    setState(() {
      
    });
  }

@override
  void initState() {
   
   GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(  //like list view but it will take whole page
        controller: PageController(initialPage: 0),

        scrollDirection: Axis.vertical,
        //itemCount: 800, //kitne item h
        onPageChanged: (value){
            GetNews();
        },
        itemBuilder: (context,index){ //like for loop
         
         return NewsContainer(
            imgUrl: 
            newsArt.imgUrl,
            //"https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bmV3c3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=900&q=60", 
            newsCnt:
            newsArt.newsCnt,
            // "5G, the fifth generation of cellular networks, heralds a new era in communications- it brings a paradigm shift in the role of mobile technologies beyond connectivity. As the country moves ahead with its Digital India vision, it offers the opportunity to leapfrog to the next generation of digital connectivity and create new business models and revenue streams", 
            newsHead:
            newsArt.newsHead,
            // "5G the fifth generation of cellular networks, heralds a new era in communications",
            newsDes:
            newsArt.newsDes,
            // "5G the fifth generation of cellular networks 5G the fifth generation of cellular networks",
            newsUrl: 
            newsArt.newsUrl);
            //"https://www.nokia.com/networks/5g/5g-in-india/"
        }
        
        ), 
    );
  }
}
