import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final bool selected;
  final Widget icon;
  final String text;
  final void Function() onTap;
  const AnimatedButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  late bool size;
  bool oneTime = true;
  @override
  void initState() {
    size = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.icon,
          AnimatedDefaultTextStyle(
            onEnd: () {
              setState(() {
                size = widget.selected;
              });
            },
            duration: Duration(milliseconds: 150),
            style: TextStyle(
                color: Colors.white.withOpacity(widget.selected ? 1 : 0),
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
