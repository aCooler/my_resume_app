import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

import 'hover_widget.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin {
  final String _cvString =
      '- Implemented website with multiple pages using flutter\n'
      '- Implemented opening sites and sending emails with url_launcher plugin\n'
      '- Provided custom animation for page transition';
  final String _notes = '- Used bloc library for simple app architecture\n'
      '- Used plugin for communication with android file system\n'
      '- Implemented custom widget for navigation and animation';
  final String _mastodon = '- Made REST client for images and text messages\n'
      '- implemented OAuth 2 with native to flutter communication implemented with plugins\n';
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: Center(
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              return orientation == Orientation.landscape
                  ? _landscapeView()
                  : _portraitView();
            },
          ),
        ),
      ),
    );
  }

  Widget _landscapeView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 90,
          child: Hero(
            tag: 'list',
            child: Container(
                color: Theme.of(context).cardColor, child: _selection()),
          ),
        ),
        Expanded(
          flex: 161,
          child: Hero(
            tag: 'avatar',
            child: Container(
              child: _selectionTexts(),
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
        Container(
          color: Theme.of(context).cardColor.withOpacity(0.9),
          child: _selectionForPortrait(),
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
            fit: BoxFit.cover,
            child: HoverWidget(
              child: GestureDetector(
                onTap: () {
                  _controller.animateTo(0);
                },
                child: Text(
                  'My CV',
                  style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 20,),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 160,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Container(
              child: HoverWidget(
                child: GestureDetector(
                  onTap: () {
                    _controller.animateTo(1);
                  },
                  child: Text(
                    'Notes App',
                    style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 20,),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 160,
          child: FittedBox(
            fit: BoxFit.cover,
            child: HoverWidget(
              child: GestureDetector(
                onTap: () {
                  _controller.animateTo(2);
                },
                child: Text(
                  'Mastodon Client',
                  style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 20,),
                ),
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 1248,
        ),
      ],
    );

    return DefaultTextStyle(
      child: selection,
      style: Theme.of(context).textTheme.headline1.copyWith(
            fontSize: 30,
          ),
    );
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
            fit: BoxFit.fill,
            child: HoverWidget(
              child: GestureDetector(
                onTap: () {
                  _controller.animateTo(0);
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
            fit: BoxFit.fill,
            child: Container(
              child: HoverWidget(
                child: GestureDetector(
                  onTap: () {
                    _controller.animateTo(1);
                  },
                  child: Text(
                    'Notes App',
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
                _controller.animateTo(2);
              },
              child: Text(
                'Mastodon Client',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1248,
          child: Container(
            color: Theme.of(context).cardColor.withOpacity(0.3),
              child: _selectionTexts()),
        ),
      ],
    );

    return selection;
  }

  Widget _selectionTexts() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Center(
          child: SingleChildScrollView(
            child: Text(
              _cvString,
              style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Colors.black,
                    fontSize: 30,
                  ),
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Text(
              _notes,
              style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Colors.black,
                    fontSize: 30,
                  ),
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Text(
              _mastodon,
              style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Colors.black,
                    fontSize: 30,
                  ),
            ),
          ),
        ),
      ],
      controller: _controller,
    );
  }
}
