import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HoverWidget extends StatefulWidget {
  final Widget child;

  HoverWidget({
    Key key,
    this.child,
  });

  @override
  _HoverWidgetState createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget>
    with TickerProviderStateMixin {
  Color color;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(
        milliseconds: 200,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  Widget _text() {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) {
        _controller.forward();
      },
      onExit: (PointerExitEvent event) {
        _controller.reverse();
      },
      child: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          children: <Widget>[
            widget.child,
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              child: LinearProgressIndicator(
                value: _controller.value,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).textTheme.headline1.color),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _text();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
