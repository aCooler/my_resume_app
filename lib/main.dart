import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_resume_app/fourth_page.dart';
import 'package:my_resume_app/hover_widget.dart';
import 'package:my_resume_app/second_page.dart';
import 'package:my_resume_app/third_page.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF2e39e0),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          cardColor: Colors.grey,
          textTheme: const TextTheme(
            headline1: TextStyle(
              color: Color(0xFFf6f8fd),
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
          '/second': (context) => SecondPage(),
          '/third': (context) => ThirdPage(),
          '/fourth': (context) => FourthPage(),
        },
      ),
    );

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  PageRoute _createRoute({
    Widget page,
  }) {
    return PageRouteBuilder<dynamic>(
      pageBuilder: (BuildContext context, Animation<dynamic> animation,
              Animation<dynamic> secondaryAnimation) =>
          page,
      transitionsBuilder: (BuildContext context, Animation<dynamic> animation,
          Animation<dynamic> secondaryAnimation, Widget child) {
        return Align(
          alignment: Alignment.topRight,
          child: RotationTransition(
            alignment: Alignment.topRight,
            turns: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
            child: ScaleTransition(
              alignment: Alignment.topRight,
              scale: animation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _landscapeView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 100,
          child: Hero(
            tag: 'list',
            child: Container(
                color: Theme.of(context).primaryColor, child: _selection()),
          ),
        ),
        Expanded(
          flex: 161,
          child: Hero(
            tag: 'avatar',
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset('photos/w.jpg').image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _portraitView() {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        Hero(
          tag: 'avatar',
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset('photos/w.jpg').image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Hero(
          tag: 'list',
          child: Container(
              color: Theme.of(context).primaryColor.withOpacity(0.9),
              child: _selection()),
        ),
      ],
    );
  }

  Widget _selection() {
    final Widget selection = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const Spacer(
          flex: 300,
        ),
        Expanded(
          flex: 160,
          child: FittedBox(
            fit: BoxFit.fill,
            child: HoverWidget(
              child: GestureDetector(
                onTap: () {
                  //Navigator.of(context).pushNamed('/second');
                  Navigator.of(context).push<dynamic>(
                    _createRoute(
                      page: SecondPage(),
                    ),
                  );
                },
                child: Text(
                  'Досвід',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 160,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Container(
              child: HoverWidget(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push<dynamic>(
                      _createRoute(
                        page: ThirdPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Проекти',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 160,
          child: HoverWidget(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push<dynamic>(
                  _createRoute(
                    page: FourthPage(),
                  ),
                );
              },
              child: Text(
                'Дозвілля',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 1248,
        ),
      ],
    );

    return selection;
  }
}
