import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: double.infinity,
        height: 90,
        color: Color(0xff220A99),
        child: AnimatedButton(
          icon: Icon(
            CupertinoIcons.house,
            color: Colors.white,
          ),
          text: 'Home',
        ),
      ),
    ));
  }
}

class AnimatedButton extends StatefulWidget {
  final Widget icon;
  final String text;
  const AnimatedButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool oneTime = true, color = true, size = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          color = !color;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.icon,
          AnimatedDefaultTextStyle(
            onEnd: () {
              oneTime
                  ? setState(() {
                      oneTime = false;
                      size = !size;
                    })
                  : oneTime = true;
            },
            duration: Duration(milliseconds: 200),
            style: TextStyle(
                color: Colors.white.withOpacity(color ? 1 : 0),
                fontSize: size ? 24 : 0),
            child: Text(
              ' ' + widget.text,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
