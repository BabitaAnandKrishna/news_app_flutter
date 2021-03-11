import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter/Helper/Data.dart';
import 'package:news_app_flutter/Helper/NewsPage.dart';
import 'package:news_app_flutter/Helper/widget.dart';
import 'package:news_app_flutter/Models/CategoryModel.dart';

class CategoryNewsPage extends StatefulWidget {
  final String category;
  CategoryNewsPage({this.category});
  @override
  _CategoryNewsPageState createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  var newslist;
  bool _loading=true;

  List<CategoryModel> category = new List<CategoryModel>();

  @override
  void initState(){
    super.initState();
    category = getCategory();
    getNews();
    getCategoryNews();
  }

  void getNews() async {
    News newsCClass = News();
    await newsCClass.getNews();
    newslist = newsCClass.news;
    setState(() {
      _loading = false;
    });
  }

  getCategoryNews() async{
    NewsForCategory newsClass = NewsForCategory();
    await newsClass.getNewsForCountry(widget.category);
    newslist = newsClass.Categorynews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/Images/news1.png",height: 30,width:30,
              fit: BoxFit.cover,
            ),
            Text("  NewsRoom",
              style:GoogleFonts.tauri(color: Colors.white, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic,fontSize: 22),
            ),
          ],
        ),
        backgroundColor: Color(0xff102A43),
        elevation: 0.0,
      ),
      body: _loading ?  Center(
        child: Container(
          child: CircularProgressIndicator(),

        ),
      ) : SingleChildScrollView(
         child: Container(
           padding: EdgeInsets.symmetric(horizontal: 16),
           decoration: BoxDecoration(
               color: Color(0xff243B53)
           ),
           child: Column(
             children: [
               SizedBox(height: 16,),
               Container(
                 alignment: Alignment.topLeft,
                 child: Text(widget.category+ "  News",
                     style:GoogleFonts.arimo(color: Colors.white, fontWeight: FontWeight.w300,fontSize:16),
                   // style: TextStyle(
                   // fontWeight: FontWeight.bold,
                   // fontSize: 18,
                   // color: Colors.white
                 // ),
                ),
               ),
               //Blog

               Container(
                 padding: EdgeInsets.only(top: 5),
                 child: ListView.builder(
                     itemCount: newslist.length,
                     shrinkWrap: true,
                     physics: ClampingScrollPhysics(),
                     itemBuilder: (context,index){
                       return Card(
                         elevation: 3,
                         child: Padding(
                           padding: const EdgeInsets.only(top: 5),
                           child: Container(
                             child: NewsTile(
                               imgUrl : newslist[index].urlToImage ?? "",
                               title: newslist[index].title ?? "",
                               desc: newslist[index].description ?? "",
                               content: newslist[index].content ?? "",
                               posturl: newslist[index].articleUrl ?? "",
                             ),
                           ),
                         ),
                       );
                     }
                 ),
               )
             ],
           ),
         ),
      ),
    );
  }
}