import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}


class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: Center(
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              if (orientation == Orientation.landscape) {
                return _landscapeView();
              } else {
                return _portraitView();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _landscapeView() {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset('photos/w.jpg').image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Under development.',
            style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.black, fontSize: 50),
          ),
        )
      ],
    );
  }

  Widget _portraitView() {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset('photos/w.jpg').image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Under development.',
            style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.black, fontSize: 50),
          ),
        )
      ],
    );
  }


}

