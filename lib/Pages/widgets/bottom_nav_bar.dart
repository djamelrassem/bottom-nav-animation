import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animated_button.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool home = true;
  bool inbox = false;
  bool profile = false;
  late PageController pageController =
      PageController(viewportFraction: 1 / 3, initialPage: 3);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Platform.isIOS ? 100 : 90,
      color: Color(0xff2A1A99),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PageView(controller: pageController, children: [
              SizedBox(),
              SizedBox(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: Color(0xFF5E58B4),
                    borderRadius: BorderRadius.circular(12)),
                height: 55,
                width: MediaQuery.of(context).size.width / 3 - 16,
              ),
              SizedBox(),
              SizedBox(),
            ]),
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: AnimatedButton(
                  onTap: () {
                    pageController.animateToPage(3,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                    setState(() {
                      home = true;
                      inbox = profile = false;
                    });
                  },
                  selected: home,
                  icon: Icon(
                    CupertinoIcons.house,
                    color: Colors.white,
                  ),
                  text: 'Home',
                ),
              ),
              Expanded(
                child: AnimatedButton(
                  onTap: () {
                    pageController.animateToPage(2,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                    setState(() {
                      inbox = true;
                      home = profile = false;
                    });
                  },
                  selected: inbox,
                  icon: Icon(
                    CupertinoIcons.cube_box,
                    color: Colors.white,
                  ),
                  text: 'Inbox',
                ),
              ),
              Expanded(
                child: AnimatedButton(
                  onTap: () {
                    pageController.animateToPage(1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                    setState(() {
                      profile = true;
                      inbox = home = false;
                    });
                  },
                  selected: profile,
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white,
                  ),
                  text: 'Profile',
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
