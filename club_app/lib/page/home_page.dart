import 'package:flutter/material.dart';
import 'package:club_app/page/board/notice_board/notice_board_page.dart';
import 'package:club_app/page/chat/chat_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:club_app/widgets/main_drawer.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
//import 'package:get/route_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final route = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
 
              child: ListView(children: <Widget>[
                /*Positioned(
                  top:40,
                  left:20,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30,
                    color: Colors.white,
                    onPressed: (){
                      _scaffoldkey.currentState.openDrawer();
                    },
                    ),
                ),*/
                _pageOfTop(),
                _pageOfMyClub(),
                SizedBox(height: 30),
                _pageOfMyClub2(),
                SizedBox(height: 30),
                _pageOfMiddle(),
                SizedBox(height: 10),
                _pageOfMiddle2(),
                SizedBox(height: 30),
                example(),
                example(),
                example(),
                example(),
                example(),
              ]),
            ),
    );
  }
}

Widget _pageOfTop() {
  return Padding(padding: EdgeInsets.only(top: 50.0));
}

Widget _pageOfMyClub() {
  String selectedClub = '동아리 1';

  void selectClub( String value){
    selectedClub = value;
  }

  return Row(children: <Widget>[
    PopupMenuButton(
      onSelected: (value) => selectClub(selectedClub),
      padding: EdgeInsets.only(right: 8.0),
      offset: Offset(-16, 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border:Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            )),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 120.0),
        child: Text(
          selectedClub,
          style: TextStyle(color: Colors.black),
        ),
      ),
      itemBuilder: (context) => <PopupMenuItem<String>>[
        new PopupMenuItem<String>(
            child: Row(
              children: <Widget>[SizedBox(width: 80),Icon(Icons.arrow_right), Text('동아리 1'), SizedBox(width: 80)],
            ),
            value: '1'),
            PopupMenuItem(child: Row(
              children: <Widget>[SizedBox(width: 80),Icon(Icons.arrow_right), Text('동아리 2'), SizedBox(width: 80)],
            ),
            value: '2',),
            PopupMenuItem(child: Row(
              children: <Widget>[SizedBox(width: 80),Icon(Icons.arrow_right), Text('동아리 3'), SizedBox(width: 80)],
            ),
            value: '3',),
      ],
    ),
  ]);
}


Widget _pageOfMyClub2() {
  //슬라이드형식 동아리선택?
  return CarouselSlider(
    options: CarouselOptions(
      height: 200.0, 
      autoPlay: true, 
      autoPlayInterval: Duration(seconds: 3)),
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                '배너 $i',
                style: TextStyle(fontSize: 16.0),
              ));
        },
      );
    }).toList(),
  );
}

Widget _pageOfMiddle() {
  return Container(
      child: Builder(
    builder: (context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoticeBoardPage()),
          );
        },
        child: Text('공지사항')),
  ));
}

Widget _pageOfMiddle2() {
  return Container(
      child: Builder(
    builder: (context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.red, onPrimary: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
        },
        child: Text('채팅')),
  ));
}

Widget example() {
  return Container(
      padding: EdgeInsets.only(top: 10, left: 10),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: 150,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(5)),
      child: Text('예시'));
}
