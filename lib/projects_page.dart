import 'package:flutter/material.dart';
import 'package:my_resume_app/hover_widget.dart';
import 'app_localizations.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({
    Key key,
  }) : super(key: key);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
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
                  'My CV',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 160,
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
                    'Mastodon Client',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 160,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              child: HoverWidget(
                child: GestureDetector(
                  onTap: () {
                    _buttonPushed(
                      pageNumber: 2,
                    );
                  },
                  child: Text(
                    'Notes',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 1168,
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
          flex: 250,
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
                  'My CV',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 40,
                      ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 160,
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
                    'Mastodon Client',
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: 40,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 160,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              child: HoverWidget(
                child: GestureDetector(
                  onTap: () {
                    _buttonPushed(
                      pageNumber: 2,
                    );
                  },
                  child: Text(
                    'Notes',
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
                  'My CV',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Text(
                AppLocalizations.of(context).translate('my_cv'),
                style: Theme.of(context).textTheme.headline2,
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
                  'Mastodon Client',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Text(
                AppLocalizations.of(context).translate('mastodon_client'),
                style: Theme.of(context).textTheme.headline2,
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
                  'Notes',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Text(
                AppLocalizations.of(context).translate('notes'),
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
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
