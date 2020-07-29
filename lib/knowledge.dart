import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_resume_app/hover_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_localizations.dart';

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
                  AppLocalizations.of(context).translate('skills'),
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
                    AppLocalizations.of(context).translate('technologies'),
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

  Widget _selectionForPortrait() {
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
                  AppLocalizations.of(context).translate('skills'),
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 40,
                      ),
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
                    AppLocalizations.of(context).translate('technologies'),
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: 40,
                        ),
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
                  AppLocalizations.of(context).translate('skills'),
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Text(
                AppLocalizations.of(context).translate('skills_overview'),
                style: Theme.of(context).textTheme.headline2,
              ),
              RichText(
                text: TextSpan(
                  text: AppLocalizations.of(context).translate('project_link'),
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
                  AppLocalizations.of(context).translate('technologies'),
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.headline2,
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                  columnWidths: {1: FractionColumnWidth(.7)},
                  children:  <TableRow>[
                    TableRow(children: <Widget>[
                      Text(
                          AppLocalizations.of(context).translate('java'),
                      ),
                      Text(AppLocalizations.of(context).translate('java_experience'),)
                    ]),
                    TableRow(children: <Text>[
                      Text(AppLocalizations.of(context).translate('kotlin'),),
                      Text(AppLocalizations.of(context).translate('kotlin_experience'),)
                    ]),
                    TableRow(children: <Text>[
                      Text(AppLocalizations.of(context).translate('dart'),),
                      Text(
                          AppLocalizations.of(context).translate('dart_experience'),)
                    ]),
                    TableRow(children: <Text>[
                      Text(AppLocalizations.of(context).translate('flutter'),),
                      Text(
                          AppLocalizations.of(context).translate('flutter_experience'),)
                    ]),
                      TableRow(
                          children: <Text>[Text(AppLocalizations.of(context).translate('ukrainian')), Text(AppLocalizations.of(context).translate('ukrainian_experience'))]),
                      TableRow(children: <Text>[
                      Text(AppLocalizations.of(context).translate('english'),),
                        Text(AppLocalizations.of(context).translate('english_experience'),),
                    ]),
                    TableRow(
                        children: <Text>[Text(AppLocalizations.of(context).translate('czech'),), Text(AppLocalizations.of(context).translate('czech_experience'),)]),
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
              color: Theme.of(context).primaryColor,
              child: _selectionForPortrait()),
        ),
      ],
    );
  }
}
