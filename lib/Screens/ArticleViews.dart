import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';

class ArticleViewPage extends StatefulWidget {
  final String Posturl;
  ArticleViewPage({@required this.Posturl});
  @override
  _ArticleViewPageState createState() => _ArticleViewPageState();
}

class _ArticleViewPageState extends State<ArticleViewPage> {

  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

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
              ),            ],
          ),
          actions: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: InkWell(child: Icon(Icons.share,color: Colors.white,),
                onTap:() {
                    final RenderBox box = context.findRenderObject();
                    Share.share( widget.Posturl,subject:widget.Posturl ,
                        sharePositionOrigin:
                        box.localToGlobal(Offset.zero) &
                        box.size);
                    },
                )
                ),
              ),
          ],
          backgroundColor: Color(0xff102A43),
          elevation: 0.0,
        ),
        body:
            Container(
              color: Color(0xff34495E),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: WebView(
                  initialUrl: widget.Posturl,
                  onWebViewCreated: ((WebViewController webViewController) {
                    _completer.complete(webViewController);
                  }),
                ),
              ),
            ),
    );
  }
}