import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_resume_app/hover_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class KnowledgePage extends StatefulWidget {
  const KnowledgePage({
    Key key,
  }) : super(key: key);

  @override
  _KnowledgePageState createState() => _KnowledgePageState();
}

class _KnowledgePageState extends State<KnowledgePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 2,
      vsync: this,
    );
  }

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
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: _textTabs(
              context: context,
            ),
          ),
        ),
      ],
    );
  }

  Widget _portraitView1() {
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
              child: _selectionForPortrait()),
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
            fit: BoxFit.scaleDown,
            child: HoverWidget(
              child: GestureDetector(
                onTap: () {
                  _buttonPushed(
                    pageNumber: 0,
                  );
                },
                child: Text(
                  'Skills',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 240,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              child: HoverWidget(
                child: GestureDetector(
                  onTap: () {
                    _buttonPushed(
                      pageNumber: 1,
                    );
                  },
                  child: Text(
                    'Technologies',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 160,
        ),
        const Spacer(
          flex: 1248,
        ),
      ],
    );

    return selection;
  }

  Widget _selectionForPortrait(

      ) {
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
            fit: BoxFit.scaleDown,
            child: HoverWidget(
              child: GestureDetector(
                onTap: () {
                  _buttonPushed(
                    pageNumber: 0,
                  );
                },
                child: Text(
                  'Skills',
                  style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 40,),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 240,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              child: HoverWidget(
                child: GestureDetector(
                  onTap: () {
                    _buttonPushed(
                      pageNumber: 1,
                    );
                  },
                  child: Text(
                    'Technologies',
                    style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 40,),
                  ),
                ),
              ),
            ),
          ),
        ),

        const Spacer(
          flex: 50,
        ),
        Expanded(
          flex: 1608,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: _textTabs(context: context),
          ),
        ),
      ],
    );

    return selection;
  }

  Widget _selectionForPortrait1() {
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
            fit: BoxFit.scaleDown,
            child: HoverWidget(
              child: GestureDetector(
                onTap: () {
                  _buttonPushed(
                    pageNumber: 0,
                  );
                },
                child: Text(
                  'Skills',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 240,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              child: HoverWidget(
                child: GestureDetector(
                  onTap: () {
                    _buttonPushed(
                      pageNumber: 1,
                    );
                  },
                  child: Text(
                    'Technologies',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1408,
          child: Container(
            color: Colors.white.withOpacity(0.7),
            child: _textTabs(context: context),
          ),
        ),
      ],
    );

    return selection;
  }

  Widget _textDetails({BuildContext context}) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Skills',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Text(
            'Good understanding of OOP, basic understanding of data structures and algorithms.\n'
            'Good working skills with Flutter and basic Android.\n'
            'Experience in Flutter widgets, plugins, cross-platform environments.\n'
            'Minor experience with Bloc by Felix Angelow.\n'
            'Experience in REST, using unpublished site APIs.',
            style: Theme.of(context).textTheme.headline2,
          ),
          RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.headline2,
                text: 'Flutter project on Github: ',
                children: <TextSpan>[
                  TextSpan(
                    text: 'https://github.com/aCooler/my_resume_app',
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        const String url =
                            'https://github.com/aCooler/my_resume_app';
                        final bool shouldLaunch = await canLaunch(url);
                        shouldLaunch
                            ? await launch(url)
                            : throw 'Could not launch $url';
                      },
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Technologies',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          DefaultTextStyle(
            style: Theme.of(context).textTheme.headline2,
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.top,
              columnWidths: {1: FractionColumnWidth(.7)},
              children: const <TableRow>[
                TableRow(children: <Widget>[
                  Text(
                    'Java',
                  ),
                  Text('good coding experience')
                ]),
                TableRow(children: <Text>[
                  Text('Kotlin'),
                  Text('minor experience (two personal projects)')
                ]),
                TableRow(children: <Text>[
                  Text('Dart'),
                  Text(
                      'major coding experience: basic syntax, asynchronous programing, collections')
                ]),
                TableRow(children: <Text>[
                  Text('Flutter'),
                  Text(
                      'major coding experience: Widgets, Animation, Navigation.')
                ]),
                TableRow(children: <Text>[Text('Ukrainian'), Text('fluent')]),
                TableRow(
                    children: <Text>[Text('English'), Text('advanced, B2')]),
                TableRow(children: <Text>[Text('Czech'), Text('basic, A2')]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textTabs({BuildContext context}) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _controller,
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Skills',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Text(
                'Good understanding of OOP, basic understanding of data structures and algorithms.\n'
                'Good working skills with Flutter and basic Android.\n'
                'Experience in Flutter widgets, plugins, cross-platform environments.\n'
                'Minor experience with Bloc by Felix Angelow.\n'
                'Experience in REST, using unpublished site APIs.',
                style: Theme.of(context).textTheme.headline2,
              ),
              RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.headline2,
                    text: 'Flutter project on Github: ',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'https://github.com/aCooler/my_resume_app',
                        style: Theme.of(context).textTheme.headline2.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            const String url =
                                'https://github.com/aCooler/my_resume_app';
                            final bool shouldLaunch = await canLaunch(url);
                            shouldLaunch
                                ? await launch(url)
                                : throw 'Could not launch $url';
                          },
                      ),
                    ]),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Technologies',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.headline2,
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                  columnWidths: {1: FractionColumnWidth(.7)},
                  children: const <TableRow>[
                    TableRow(children: <Widget>[
                      Text(
                        'Java',
                      ),
                      Text('good coding experience')
                    ]),
                    TableRow(children: <Text>[
                      Text('Kotlin'),
                      Text('minor experience (two personal projects)')
                    ]),
                    TableRow(children: <Text>[
                      Text('Dart'),
                      Text(
                          'major coding experience: basic syntax, asynchronous programing, collections')
                    ]),
                    TableRow(children: <Text>[
                      Text('Flutter'),
                      Text(
                          'major coding experience: Widgets, Animation, Navigation.')
                    ]),
                    TableRow(
                        children: <Text>[Text('Ukrainian'), Text('fluent')]),
                    TableRow(children: <Text>[
                      Text('English'),
                      Text('advanced, B2')
                    ]),
                    TableRow(
                        children: <Text>[Text('Czech'), Text('basic, A2')]),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _buttonPushed({int pageNumber}) {
    _controller.animateTo(pageNumber);
  }

  Widget _portraitView() {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        Hero(
          tag: 'list',
          child: Container(
              color: Theme.of(context).primaryColor, child: _selectionForPortrait()),
        ),
      ],
    );
  }
}
