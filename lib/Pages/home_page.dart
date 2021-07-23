import 'package:bottom_nav_animation/Pages/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Color(0xffCDD5FF),
            alignment: Alignment.center,
            child: Text(
              'Home',
              style: TextStyle(color: Color(0xff110a88), fontSize: 32),
            ),
          ),
          Container(
            color: Color(0xff5e58b4),
            alignment: Alignment.center,
            child: Text(
              'Inbox',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
          Container(
            color: Color(0xffa8a8eb),
            alignment: Alignment.center,
            child: Text(
              'Profile',
              style: TextStyle(color: Color(0xff110a88), fontSize: 32),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
