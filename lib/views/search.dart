import 'package:flutter/material.dart';
import 'package:project/widgets/widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              color:Color(0x54FFFFFF),
              padding: EdgeInsets.symmetric(vertical: 24 ,horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                      child:TextField(
                        controller: searchTextEditingController,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        decoration: InputDecoration(
                          hintText: "Search Username",
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                            border:InputBorder.none,
                        ),
                      ),
                  ),
                      Container(
                        height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            gradient:LinearGradient(
                              colors: [
                                const Color(0x36FFFFFF),
                                const Color(0x0FFFFFFF)
                              ]
                            ), 
                              borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(10),
                          child: Image.asset("asset/Image/search_white.png")
                      ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
