import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gojek_replicate/models/team_model.dart';
import 'package:gojek_replicate/views/navigations/soccer/detail_soccer.dart';
import 'package:gojek_replicate/widget/search_widget.dart';
import 'package:http/http.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SoccerPage extends StatefulWidget {
  const SoccerPage({Key? key}) : super(key: key);

  @override
  _SoccerPageState createState() => _SoccerPageState();
}

class _SoccerPageState extends State<SoccerPage> with AutomaticKeepAliveClientMixin<SoccerPage> {
  late List<TeamModel> allList = [];
  late List<TeamModel> list = [];
  late List<dynamic> data;
  bool isLoading = false;
  String query = '';
  String hintText = 'Search...';

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: isLoading
              ? Center(
              child: CircularProgressIndicator())
              : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Discover',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 40)),
                      Text('English Premier League teams',
                          style: TextStyle(color: Colors.grey, fontSize: 18)),
                      buildSearch(),
                      SizedBox(height: 20),
                      buildList(list)
                    ],
                  )),
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    fetchTeams();
  }

  Future<void> fetchTeams() async {
    setState(() {
      isLoading = true;
    });

    final response = await get(Uri.parse(
        'https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=English%20Premier%20League'));

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var res = jsonDecode(response.body);
      setState(() {
        data = res['teams'];
        for (int i = 0; i < data.length; i++) {
          allList.add(new TeamModel(
              data[i]['idTeam'],
              data[i]['strTeam'],
              data[i]['strStadium'],
              data[i]['strStadiumLocation'],
              data[i]['strDescriptionEN'],
              data[i]['strTeamBadge']));

          list = allList;
        }
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load teams');
    }
  }

  String formatDate(dateString) {
    initializeDateFormatting('id_ID', null);
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(date);
    return formattedDate;
  }

  void searchData(String query) {
    final list = allList.where((list) {
      final titleLower = list.strTeam.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.list = list;
    });
  }

  Widget buildSearch() =>
      SearchWidget(text: query, onChanged: searchData, hintText: hintText);

  Widget buildList(List<TeamModel> list) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailSoccerPage(list[index]);
            }));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        height: 100,
                        imageUrl: list[index].strTeamBadge,
                        placeholder: (context, url) => Image.asset(
                          'assets/soccer.png',
                          height: 200,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/soccer.png',
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(list[index].strTeam,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16)),
                        SizedBox(height: 10),
                        Text(
                          '${list[index].strDescriptionEN}',
                          style: TextStyle(fontSize: 14),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: list.length,
    );
  }
}
