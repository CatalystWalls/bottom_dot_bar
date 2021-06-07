import 'package:bottom_bar_line/bottom_bar_line.dart';
import 'package:bottom_bar_line/bottom_bar_line_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Example",
      // theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int currentPage;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    currentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.red,
            child: Center(
              child: Text('PAGE 1'),
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.blue,
            child: Center(
              child: Text('PAGE 2'),
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.orange,
            child: Center(
              child: Text('PAGE 3'),
            ),
          ),
        ],
        onPageChanged: (int index) {
          if (pageController.position.userScrollDirection !=
              ScrollDirection.idle)
            setState(() {
              currentPage = index;
            });
        },
      ),
      bottomNavigationBar: BottomBarLine(
          navItems: BottomNavItems.textOnly,
          currentIndex: currentPage,
          onTap: (int index) {
            if (index != currentPage) {
              pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 360),
                curve: Curves.fastOutSlowIn,
              );
              setState(() {
                currentPage = index;
              });
            }
          },
          items: [
            BottomBarLineItem(
              title: Text('hello'),
              icon: Icon(Icons.home),
              selectedColor: Colors.red,
            ),
            BottomBarLineItem(
              title: Text('hello'),
              icon: Icon(Icons.library_books),
              selectedColor: Colors.blue,
            ),
            BottomBarLineItem(
              title: Text('hello'),
              icon: Icon(Icons.headset),
              selectedColor: Colors.orange,
            ),
          ],
          highlightColor: Colors.red,
          splashColor: Colors.blue),
    );
  }
}
