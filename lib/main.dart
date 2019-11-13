import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    FirstPage(),
    Center(child: Icon(Icons.search)),
    Center(child: Icon(Icons.add_circle_outline)),
    Center(child: Icon(Icons.chat)),
    Center(child: Icon(Icons.account_circle)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.format_quote),
              title: Text('Suits'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              title: Text('Add'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('Chat'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Account'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.lightBlue,
              height: 24,
            ),
            Expanded(child: _widgetOptions.elementAt(_selectedIndex)),
          ],
        ));
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          indicatorColor: Colors.lightBlue,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          labelColor: Colors.lightBlue,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              text: 'RECENT',
            ),
            Tab(
              text: 'HISTORY',
            ),
          ],
        ),
        body: TabBarView(
          children: [
            RecentPage(),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}

class RecentPage extends StatelessWidget {
  final int _hour = DateTime.now().hour;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              'Et vous, qui allez-vous retrouver?',
              style: TextStyle(color: Colors.white, fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Bus ou covoiturage : choisissez le trajet qui vous convient le mieux',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(child: Container()),
          Container(
            width: MediaQuery.of(context).size.width - 64,
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'PROPOSER UN TRAJET',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Container(
              width: MediaQuery.of(context).size.width - 64,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'RECHERCHER',
                  style: TextStyle(
                    color: Colors.lightBlue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width - 64,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 16, right: 32, bottom: 16),
                    child: Text(
                      'Et si vous aussi vous economisiez 219E sur votre assurance auto?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 32, bottom: 2),
                  child: Image.asset(
                    'assets/Spanish app img.png',
                    height: 82,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage((_hour >= 6 && _hour <= 18)
                  ? 'assets/bg_day.jpg'
                  : 'assets/bg_ecity.png'),
              fit: BoxFit.cover)),
    );
  }
}
