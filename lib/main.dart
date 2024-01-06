import 'package:flutter/material.dart';
import 'package:quotes_app/api/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quotes_app/quote_gen.dart';
import 'package:quotes_app/quote_sec.dart';
import 'package:quotes_app/share_sec.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchQuote();
    getImgData();
  }

  var urlData;

  static const accKey = 'Ot4J2bxG5NzYmG4t-_i23fp5-8siMR-w9Vr6f0qnm64';

  bool inProgress = false;
  QuotesGetter? quote;
  var imgUrl;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      urlData['urls']['full'],
                    ),
                    fit: BoxFit.fill)),
            child: Stack(
              children: [
                Container(
                  color: Colors.black45,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShareSec(quote: quote),
                    QuoteSec(quote: quote),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          _fetchQuote();
                          getImgData();
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: 50),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.black38, shape: BoxShape.circle),
                            child: Icon(
                              Icons.restart_alt,
                              size: 55,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getImgData() async {
    var baseImgUrl =
        'https://api.unsplash.com/photos/random/?client_id=${accKey}';
    var uri = Uri.parse(baseImgUrl);
    final res = await http.get(uri);
    setState(() {
      urlData = jsonDecode(res.body);
    });
  }

  _fetchQuote() async {
    setState(() {
      inProgress = true;
    });
    try {
      final fetchedQuote = await Api.fetchRanQuote();
      setState(() {
        quote = fetchedQuote;
      });
    } catch (e) {
      debugPrint("Error ${e}");
    } finally {
      setState(() {
        inProgress = false;
      });
    }
  }
}
