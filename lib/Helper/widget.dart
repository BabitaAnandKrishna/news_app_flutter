import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/Screens/ArticleViews.dart';
import 'package:news_app_flutter/Screens/CategoryNews.dart';
import 'package:google_fonts/google_fonts.dart';

Widget MyAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       // Icon(AssetImage(""assets/Images/mobile.png"")),
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
  );
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleViewPage(
                      Posturl: posturl,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    imgUrl,
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  desc,
                  maxLines: 2,
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                )
              ],
            ),
          )),
    );
  }
}

class NewsTileTitle extends StatelessWidget {
  final String title;
  NewsTileTitle({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                children: [Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize:16,
                    fontWeight: FontWeight.w500,
                      // color: Colors.white,
                      foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1
                      ..color = Colors.black87,
                      ),
                ),

              Text(
                title,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
             ],
          ),
    ],
          ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNewsPage(
              category: categoryName.toLowerCase(),
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: 110,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Color(0xff307B30), width: 1),
              color: Color(0xff028394),
            ),
            child: Text(
              categoryName,
              style: GoogleFonts.arimo(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
