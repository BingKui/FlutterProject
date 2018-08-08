import 'package:flutter/material.dart';

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(choices);
    return new MaterialApp(
      home: new DefaultTabController(
        length: choices.length,
        child: new Scaffold(
          appBar: new TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return new Tab(
                  text: choice.title,
                );
              }).toList(),
            ),
          body: new TabBarView(
            children: choices.map((Choice choice) {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({ this.title});
  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR'),
  const Choice(title: 'BICYCLE'),
  const Choice(title: 'BOAT'),
  const Choice(title: 'BUS'),
  const Choice(title: 'TRAIN'),
  const Choice(title: 'WALK'),
  const Choice(title: '1'),
  const Choice(title: '2'),
  const Choice(title: '3'),
  const Choice(title: '4'),
  const Choice(title: '5'),
  const Choice(title: '6'),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    // final TextStyle textStyle = Theme.of(context).textTheme.display1;
    final TextStyle textStyle = new TextStyle(fontSize: 32.0, color: Colors.black);
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
