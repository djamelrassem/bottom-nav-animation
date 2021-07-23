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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Platform.isIOS ? 100 : 90,
      color: Color(0xff220F99),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: AnimatedButton(
              onTap: () {
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
    );
  }
}
