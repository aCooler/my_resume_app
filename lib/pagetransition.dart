//PageTransitionType.upToDown:
//                  return SlideTransition(
//                    transformHitTests: false,
//                    position: Tween<Offset>(
//                      begin: const Offset(0.0, -1.0),
//                      end: Offset.zero,
//                    ).animate(animation),
//                    child: new SlideTransition(
//                      position: new Tween<Offset>(
//                        begin: Offset.zero,
//                        end: const Offset(0.0, 1.0),
//                      ).animate(secondaryAnimation),
//                      child: child,
//                    ),
//                  );

//Widget _landscapeView1() {
//  return Column(
//    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//    children: <Widget>[
//      Container(
//        color: Colors.black,
//      ),
//      Stack(
//        alignment: Alignment.topRight,
//        children: <Widget>[
//          Hero(
//            tag: 'avatar',
//            child: Container(
//              alignment: Alignment.topRight,
//              margin: const EdgeInsets.all(40),
//              padding: const EdgeInsets.all(40),
//              height: 200,
//              width: 200,
//              decoration: BoxDecoration(
//                shape: BoxShape.circle,
//                image: DecorationImage(
//                  image: Image.asset('photos/w.jpg').image,
//                  fit: BoxFit.cover,
//                ),
//              ),
//              //child: Container(color: Colors.red,),
//            ),
//          ),
//          Container(
//            child: Row(
//              children: <Widget>[
//                Expanded(
//                  flex: 4,
//                  child: Container(
//                    color: Theme.of(context).primaryColor,
//                    child: _skillsText(),
//                  ),
//                ),
//                const Spacer(
//                  flex: 1,
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//      TabBar(
//        indicatorColor: Theme.of(context).textTheme.headline1.color,
//        tabs: const <Widget>[
//          Tab(
//            child: Text(
//              'Work Skills',
//              style: TextStyle(
//                  fontSize: 15,
//                  color: Colors.white,
//                  fontWeight: FontWeight.bold),
//            ),
//          ),
//          Tab(
//            child: Text(
//              'Languages and technologies',
//              style: TextStyle(
//                  fontSize: 15,
//                  color: Colors.white,
//                  fontWeight: FontWeight.bold),
//            ),
//          ),
//        ],
//      ),
//    ],
//  );
//}
//
//Widget _landscapeView2() {
//  return Column(
//    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//    children: <Widget>[
//      Container(
//        color: Theme.of(context).primaryColor,
//        child: DefaultTextStyle(
//          style: const TextStyle(
//            fontSize: 40,
//          ),
////            child: TabBar(
////              indicatorColor: Theme.of(context).textTheme.headline1.color,
////              tabs: <Widget>[
////                Padding(
////                  padding: const EdgeInsets.all(8.0),
////                  child: Text(
////                    'Skills',
////                  ),
////                ),
////                Padding(
////                  padding: const EdgeInsets.all(8.0),
////                  child: Text(
////                    'Technologies',
////                  ),
////                ),
////              ],
////            ),
//        ),
//      ),
//      Expanded(
//        child: Container(
//          color: Colors.black,
//        ),
//      ),
//    ],
//  );
//}