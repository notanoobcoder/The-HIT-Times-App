import 'package:flutter/material.dart' ;
import './CenterPage.dart' as center;
import './LeftPage.dart' as left;
import './RightPage.dart' as right;

void main() {
  runApp(new MaterialApp(
      home: new MyTabs()
  ));
}

class MyTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'The HIT Times',
      home: new MyPage(),
    );
  }
}
class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyTabs();
  }
}

class _MyTabs extends State<MyPage> with SingleTickerProviderStateMixin {

  PageController _pageController;
  int _page = 0;
  /// Indicating the current displayed page
  /// 0: About
  /// 1: Feed
  /// 2: Details


  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("The HIT Times"),
          backgroundColor: Colors.blue,
        ),
        body: new PageView(
            children: [
              new Container(child: new center.CenterPage()),
              new Container(child: new right.RightPage())
            ],
            // ignore: argument_type_not_assignable
            controller: _pageController,
            onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.whatshot),
                  title: new Text("Feed")
              ),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.details),
                  title: new Text("Details")
              )
            ],
          onTap: navigationTapped,
            currentIndex: _page
        ),
        drawer: new Drawer(
          child: new left.LeftPage()
        )
    );
  }
  void navigationTapped(int page){

    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 150),
        curve: Curves.ease
    );
  }
  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
