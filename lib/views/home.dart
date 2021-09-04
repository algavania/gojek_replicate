import 'package:flutter/material.dart';
import 'package:gojek_replicate/views/navigations/calculator.dart';
import 'package:gojek_replicate/views/navigations/soccer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.calculate)),
                Tab(icon: Icon(Icons.sports_soccer)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Tab(child: Calculator()),
              Tab(child: SoccerPage()),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        )
    );
  }
}
