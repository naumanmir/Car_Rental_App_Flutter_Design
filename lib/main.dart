import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.purple,
                        size: 28,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text(
                          "Which categories do you want to see the most?",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: 12),
                    Container(
                        child: LinearPercentIndicator(
                      padding: EdgeInsets.fromLTRB(17, 0, 20, 0),
                      fillColor: Colors.white,
                      progressColor: Colors.purple,
                      percent: 0.05,
                      width: MediaQuery.of(context).size.width,
                      lineHeight: 3,
                    )),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.60,
                      child: buildGrid(context),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(left: 12, right: 12),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        padding: EdgeInsets.only(left: 12, right: 12),
                        color: Colors.purple[200],
                        textColor: Colors.white,
                        child: Text(
                          "Create My Feed",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }

  @override
  Widget buildGrid(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (MediaQuery.of(context).size.width - 60 / 2) / 300,
      children: <Widget>[
        buildTile(context, 0, "Cars", null, Icons.directions_car, "1,456 items",
            Colors.orange[200]),
        buildTile(context, 1, "Helicopters",
            Image.asset("assets/helicopter.png"), null, "658 items", null),
        buildTile(context, 2, "Boats", null, Icons.directions_boat, "217 items",
            Colors.purple[200]),
        buildTile(context, 3, "Scooters", null, Icons.directions_bike,
            "24 items", Colors.red[200]),
        buildTile(context, 4, "Trucks", null, Icons.train, "7,245 items",
            Colors.yellow[200]),
        buildTile(context, 5, "Planes", null, Icons.airplanemode_active,
            "3,901 items", Colors.green[200]),
      ],
    );
  }

  int _selectedIndex = -1;

  @override
  Widget buildTile(BuildContext context, int index, String heading, Image image,
      IconData icon, String itemCount, Color color) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
          print("tapped");
        },
        child: Container(
          decoration: BoxDecoration(
              color:
                  _selectedIndex == index ? Colors.purple[200] : Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  index == 1
                      ? IconButton(
                          icon: image,
                          onPressed: () {},
                          color: Colors.red,
                        )
                      : Icon(
                          icon,
                          color: color,
                        ),
                  index != 1
                      ? SizedBox(
                          height: 4,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  Text(
                    heading,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    itemCount,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ))),
        ),
      ),
    );
  }
}
