import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          //appBar: AppBar(),
          body: Center(
            child: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                return (orientation == Orientation.landscape)
                    ? _portraitView()
                    : _portraitView();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _landscapeView() {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).cardColor,
        title: TabBar(
          unselectedLabelColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            Text(
              'Skills',
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: 40,
                    color: Colors.white,
                  ),
            ),
            Text(
              'Technologies',
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: 40,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
      body: Container(
        //color: Theme.of(context).primaryColor,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                child: _skillsText(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: LayoutBuilder(builder: (
                        BuildContext context,
                        BoxConstraints constraints,
                      ) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: 16.0,
                            left: 8,
                            top: 8,
                            bottom: 8,
                          ),
                          child: Hero(
                            tag: 'avatar',
                            child: CircleAvatar(
                              radius: constraints.maxWidth / 2 - 11,
                              backgroundColor: Theme.of(context).cardColor,
                              child: CircleAvatar(
                                radius: constraints.maxWidth / 2 - 16,
                                backgroundImage:
                                    Image.asset('photos/w.jpg').image,
                              ),
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _portraitView() {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: TabBar(
          unselectedLabelColor: Colors.transparent,
          indicatorColor: Theme.of(context).primaryColor,
          tabs: <Widget>[
            Text(
              'Skills',
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: 20,
                    color: Colors.black,
                  ),
            ),
            Text(
              'Technologies',
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: 20,
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
      body: Container(
        //color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      left: 40.0,
                    ),
                    color: Colors.white,
                    child: Center(
                      child: LayoutBuilder(
                        builder: (
                          BuildContext context,
                          BoxConstraints constraints,
                        ) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 8.0,
                              left: 8,
                              top: 8,
                              bottom: 8,
                            ),
                            child: Hero(
                              tag: 'avatar',
                              child: CircleAvatar(
                                radius: constraints.maxHeight / 2 - 11,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: CircleAvatar(
                                  radius: constraints.maxHeight / 2 - 16,
                                  backgroundImage:
                                      Image.asset('photos/w.jpg').image,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: _skillsTextForPortrait(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _skillsText() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              margin: const EdgeInsets.only(
                left: 40,
                top: 20,
              ),
              child: TabBarView(
                children: <Widget>[
                  SingleChildScrollView(
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.top,
                        columnWidths: {1: const FractionColumnWidth(.7)},
                        children: <TableRow>[
                          const TableRow(children: <Widget>[
                            Text(
                                'Good understanding of OOP, basic understanding of data structures and algorithms.'),
                          ]),
                          const TableRow(children: <Widget>[
                            Text(
                                'Good working skills with Flutter and basic Android.'),
                          ]),
                          const TableRow(children: <Widget>[
                            Text(
                                'Experience in Flutter widgets, plugins, cross-platform environments.'),
                          ]),
                          const TableRow(children: <Widget>[
                            Text(
                                'Minor experience with Bloc by Felix Angelow.'),
                          ]),
                          const TableRow(children: <Widget>[
                            Text(
                                'Experience in REST, using unpublished site APIs.')
                          ]),
                          TableRow(children: <Widget>[
                            DefaultTextStyle(
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                              child: RichText(
                                text: TextSpan(
                                    text: 'Flutter project on Github: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .copyWith(
                                          fontSize: 30,
                                          color: Colors.black,
                                        ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .copyWith(
                                              fontSize: 30,
                                              color: Colors.black,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                        text:
                                            'https://github.com/aCooler/ivory_mirinae',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            const String url =
                                                'https://github.com/aCooler/ivory_mirinae';
                                            final bool shouldLaunch =
                                                await canLaunch(url);
                                            shouldLaunch
                                                ? await launch(url)
                                                : throw 'Could not launch $url';
                                          },
                                      ),
                                    ]),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.top,
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
                          TableRow(children: <Text>[
                            Text('Ukrainian'),
                            Text('fluent')
                          ]),
                          TableRow(children: <Text>[
                            Text('English'),
                            Text('advanced, B2')
                          ]),
                          TableRow(children: <Text>[
                            Text('Czech'),
                            Text('basic, A2')
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _skillsTextForPortrait() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              margin: const EdgeInsets.only(
                left: 40,
                top: 20,
              ),
              child: TabBarView(
                children: <Widget>[
                  SingleChildScrollView(
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      child: Table(
                        defaultVerticalAlignment:
                        TableCellVerticalAlignment.top,
                        columnWidths: {1: const FractionColumnWidth(.7)},
                        children: <TableRow>[
                          const TableRow(children: <Widget>[
                            Text(
                                'Good understanding of OOP, basic understanding of data structures and algorithms.'),
                          ]),
                          const TableRow(children: <Widget>[
                            Text(
                                'Good working skills with Flutter and basic Android.'),
                          ]),
                          const TableRow(children: <Widget>[
                            Text(
                                'Experience in Flutter widgets, plugins, cross-platform environments.'),
                          ]),
                          const TableRow(children: <Widget>[
                            Text(
                                'Minor experience with Bloc by Felix Angelow.'),
                          ]),
                          const TableRow(children: <Widget>[
                            Text(
                                'Experience in REST, using unpublished site APIs.')
                          ]),
                          TableRow(children: <Widget>[
                            DefaultTextStyle(
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              child: RichText(
                                text: TextSpan(
                                    text: 'Flutter project on Github: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .copyWith(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .copyWith(
                                          fontSize: 20,
                                          color: Colors.black,
                                          decoration:
                                          TextDecoration.underline,
                                        ),
                                        text:
                                        'https://github.com/aCooler/ivory_mirinae',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            const String url =
                                                'https://github.com/aCooler/ivory_mirinae';
                                            final bool shouldLaunch =
                                            await canLaunch(url);
                                            shouldLaunch
                                                ? await launch(url)
                                                : throw 'Could not launch $url';
                                          },
                                      ),
                                    ]),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      child: Table(
                        defaultVerticalAlignment:
                        TableCellVerticalAlignment.top,
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
                          TableRow(children: <Text>[
                            Text('Ukrainian'),
                            Text('fluent')
                          ]),
                          TableRow(children: <Text>[
                            Text('English'),
                            Text('advanced, B2')
                          ]),
                          TableRow(children: <Text>[
                            Text('Czech'),
                            Text('basic, A2')
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
