import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:getwidget/getwidget.dart';


final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];


final List<String> imageList = [
  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
  "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
  "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
];


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFFAC8C8, {
        50: Color(0xFFEDF2FF),
        100: Color(0xFFDBE4FF),
        200: Color(0xFFBAC8FF),
        300: Color(0xFF91A7FF),
        400: Color(0xFF748FFC),
        500: Color(0xFF5C7CFA),
        600: Color(0xEFC9B1FF),
        700: Color(0xFF4263EB),
        800: Color(0xFF3B5BDB),
        900: Color(0xFFFAC8C8),
        }),
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IAM'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('ser button is clicked');
            },
          ),
        ],

      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.jpg'),
                backgroundColor: Colors.white,
              ),
              accountName: Text('사용자이름'),
              accountEmail: Text('eodog@naver.com'),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              // 화살표 만들기
              decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)
                  )
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,
                  color: Colors.red[100]),
              title: Text('Home'),
              onTap: () {
                print('Home is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.settings,
                  color: Colors.red[100]),
              title: Text('Setting'),
              onTap: () {
                print('Settiong is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_answer,
                  color: Colors.red[100]),
              title: Text('Q&A'),
              onTap: () {
                print('Q&A is clicked');
              },
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ), //drawer:scaffold안에 있는 속성임(햄버거 메뉴 나온다)
      //메인
      body:
      //_buildMiddle(),
      Column(
        children: <Widget>[

          _buildMiddle(),
          GFImageOverlay(
            height: 130,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            // width: ,
            child: Center(
              child: Text('퍼스널컬러 진단', style:TextStyle(color: GFColors.LIGHT)),
            ),
            image: AssetImage('assets/images/color.jpg'),

            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3),
                BlendMode.darken),
          ),
          
          GFImageOverlay(
            height: 130,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            // width: ,
            child: Center(
              child: Text('얼굴형 분석', style:TextStyle(color: GFColors.LIGHT)),
            ),
            image: AssetImage('assets/images/color.jpg'),
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3),
                BlendMode.darken),
          ),

          // ListTile(
          //   leading: Icon(Icons.settings,
          //       color: Colors.red[100]),
          //   title: Text('Setting'),
          //   onTap: () {
          //     print('Settiong is clicked');
          //   },
          //   trailing: Icon(Icons.add),
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings,
          //       color: Colors.red[100]),
          //   title: Text('Setting'),
          //   onTap: () {
          //     print('Settiong is clicked');
          //   },
          //   trailing: Icon(Icons.add),
          // ),
        ],
      ),


      //하단바
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'search',
        ),
      ]),
    );
  }


//이미지 캐라셀
  final List<Widget> imageSliders = imgList
      .map((item) =>
      Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                  ),
                ],
              )),
        ),
      ))
      .toList();


  Widget _buildMiddle() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        enlargeFactor: 0.4,
      ),
      items: imageSliders,
    );
  }

  Widget buildCarousel(){
    return GFCarousel(
      items: imageList.map(
            (url) {
          return Container(
            margin: EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: 1000.0
              ),
            ),
          );
        },
      ).toList(),
      // onPageChanged: (index) {
      //   setState(() {
      //     index;
      //   });
      // },
    );
  }

}

