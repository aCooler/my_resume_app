import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_resume_app/fourth_page.dart';
import 'package:my_resume_app/hover_widget.dart';
import 'package:my_resume_app/knowledge.dart';
import 'package:my_resume_app/projects_page.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_localizations.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => LocaleModel(),
        child: Consumer<LocaleModel>(
          builder: (BuildContext context, provider, Widget child) => MaterialApp(
            locale: Provider.of<LocaleModel>(context).locale,
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
                headline2: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                headline3: TextStyle(color: Color(0xFFf6f8fd), fontSize: 30),
              ),
            ),
            supportedLocales: <Locale>[
              Locale('en', 'US'),
              Locale('uk', 'UK'),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            localeResolutionCallback: (Locale locale, supportedLocales) {
              for (Locale supportedLocale in supportedLocales) {
                if (supportedLocale != null &&
                    supportedLocale.languageCode != null) {
                  if (supportedLocale.languageCode == locale.languageCode) {
                    return supportedLocale;
                  }
                }
              }
              return supportedLocales.first;
            },
            home: const MyHomePage(),
          ),
        ),
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
                  Navigator.of(context).push<dynamic>(
                    _createRoute(
                      page: const KnowledgePage(),
                    ),
                  );
                },
                child: Text(
                  AppLocalizations.of(context).translate('experience'),
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
                        page: const ProjectsPage(),
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context).translate('projects'),
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
                AppLocalizations.of(context).translate('hobbies'),
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 494,
        ),
        Expanded(
          flex: 200,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text(
              AppLocalizations.of(context).translate('name'),
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        Expanded(
          flex: 200,
          child: FittedBox(
            fit: BoxFit.fill,
            child: FlatButton(
              disabledColor: Theme.of(context).textTheme.headline1.color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context).translate('hire'),
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              onPressed: () {
                final Uri _emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: 'kozakiandriy17@gmail.com',
                );
                launch(_emailLaunchUri.toString());
              },
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(
          flex: 294,
        ),
        Expanded(
          flex: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ToggleSwitch(
              minWidth: 90.0,
              initialLabelIndex:
                  Localizations.localeOf(context) == const Locale('en') ? 0 : 1,
              activeBgColor: Colors.white,
              activeFgColor: Colors.black,
              inactiveBgColor: Colors.black,
              inactiveFgColor: Colors.white,
              labels: const <String>['English', 'Українська'],
              onToggle: (int index) {
                index == 0
                    ? Provider.of<LocaleModel>(context, listen: false)
                        .changelocale(const Locale('en'))
                    : Provider.of<LocaleModel>(context, listen: false)
                        .changelocale(const Locale('uk'));
              },
            ),
          ),
        ),
      ],
    );

    return selection;
  }
}
