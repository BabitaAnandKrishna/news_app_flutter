import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/Helper/Data.dart';
import 'package:news_app_flutter/Helper/NewsPage.dart';
import 'package:news_app_flutter/Helper/widget.dart';
import 'package:news_app_flutter/Models/CategoryModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = true;
  var newslist;
  List<CategoryModel> category = new List<CategoryModel>();

  @override
  void initState() {
    _loading = true;
    super.initState();
    category = getCategory();
    getNews();
  }

  void getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    newslist = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/Images/news1.png",
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
            Text(
              "  NewsRoom",
              style: GoogleFonts.tauri(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 22),
            ),
          ],
        ),

        backgroundColor: Color(0xff102A43),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  decoration: BoxDecoration(color: Color(0xff243B53)),
                  child: Column(
                    children: [
                      VxSwiper.builder(
                        itemCount: category.length,
                        viewportFraction:1.25,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayCurve: Curves.easeInToLinear,
                        enlargeCenterPage: true,
                        autoPlayInterval: Duration(seconds: 10),
                        height: context.screenHeight*0.23,
                        itemBuilder: (context, index) {
                          return VxBox(
                            child: Stack(
                              children: [
                                NewsTile(
                                  title:"",
                                  imgUrl:newslist[index].urlToImage ?? "",
                                  posturl:newslist[index].articleUrl ?? "",
                                  desc: "",
                                  content: "",
                                ).p0(),
                                NewsTileTitle(
                                  title: newslist[index].title ?? "",
                                ).py64(),
                              ],
                            ).scrollVertical(),
                          ).p0.make();
                        },
                      ).py0(),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Categories",
                          style: GoogleFonts.arimo(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 18),
                        ),
                      ),
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 55,
                        child: ListView.builder(
                            itemCount: category.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 5,
                                child: CategoryTile(
                                  categoryName: category[index].categoryName,
                                  imageUrl: category[index].imageUrl,
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Articles",
                          style: GoogleFonts.arimo(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 18),
                        ),
                      ),
                      //Blog
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: ListView.builder(
                            itemCount: newslist.length,
                            shrinkWrap: true,
                            reverse: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: NewsTile(
                                    imgUrl: newslist[index].urlToImage ?? "",
                                    title: newslist[index].title ?? "",
                                    desc: newslist[index].description ?? "",
                                    content: newslist[index].content ?? "",
                                    posturl: newslist[index].articleUrl ?? "",
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
