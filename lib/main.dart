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
  MyHomePage({Key key, this.title, this.pageNumber = 0}) : super(key: key);

  final String title;
  final int pageNumber;

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
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.pageNumber;
    });
  }

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

class RecentPage extends StatefulWidget {
  @override
  _RecentPageState createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
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
              'OUBBA, pour une ville intélligente',
              style: TextStyle(color: Colors.white, fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Prenez votre ville en main : choisissez le trajet qui vous convient le mieux',
              style: TextStyle(
                color: Colors.white70,
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
            child: FlatButton.icon(
              onPressed: () {
                showDialog(
                    context: this.context,
                    builder: (context) => AlertDialog(
                          title: Text('Alert!'),
                          content: Text('Some message here.'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Annuler'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text('Valider'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ));
              },
              icon: Icon(
                Icons.gps_fixed,
                color: Colors.white,
              ),
              label: Text(
                'VIA GPS',
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
              child: FlatButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(
                                pageNumber: 1,
                              )));
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.lightBlue,
                ),
                label: Text(
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
