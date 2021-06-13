import 'dart:convert';
import 'package:dicoding_flutter_submission/models/club_model.dart';
import 'package:dicoding_flutter_submission/screen/detail_screen.dart';
import 'package:dicoding_flutter_submission/screen/onsearch_detail_screen.dart';
import 'package:dicoding_flutter_submission/widgets/club_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  List<ClubModel> _listClub = [];
  List<ClubModel> _searchClub = [];
  bool _isLoading = false;

  Future _getData() async {
    _isLoading = true;
    var url = Uri.parse(
        'https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=English%20Premier%20League');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      var listData = jsonDecode(response.body)['teams'];

      setState(() {
        for (var data in listData) {
          _listClub.add(ClubModel.fromJson(data));
          _isLoading = false;
        }
      });
    }
  }

  void _onSearch(String inputValue) {
    _searchClub.clear();
    if (inputValue.isEmpty) {
      setState(() {});
      return;
    } else {
      _listClub.forEach((f) {
        if (f.strTeam.toLowerCase().contains(inputValue) ||
            f.strLeague.toLowerCase().contains(inputValue)) {
          _searchClub.add(f);
        }
      });
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.cyan[300],
        title: Text('Football Club'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: ListTile(
              leading: Icon(Icons.search),
              title: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
                controller: _controller,
                onChanged: _onSearch,
              ),
              trailing: IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  _controller.clear();
                  _onSearch('');
                },
              ),
            ),
          ),
          _isLoading
              ? Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.cyan[300]),
                    ),
                  ),
                )
              : Expanded(
                  child: _searchClub.length != 0 || _controller.text.isNotEmpty
                      ? ListView.builder(
                          itemCount: _searchClub.length,
                          itemBuilder: (context, index) {
                            final searchClub = _searchClub[index];
                            return ClubWidget(
                              image: searchClub.strTeamBadge,
                              name: searchClub.strTeam,
                              league: searchClub.strLeague,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OnSearchDetailScreen(club: searchClub),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: _listClub.length,
                          itemBuilder: (context, index) {
                            final club = _listClub[index];
                            return ClubWidget(
                                image: club.strTeamBadge,
                                name: club.strTeam,
                                league: club.strLeague,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailScreen(club: club),
                                    ),
                                  );
                                });
                          },
                        ),
                )
        ],
      ),
    );
  }
}
