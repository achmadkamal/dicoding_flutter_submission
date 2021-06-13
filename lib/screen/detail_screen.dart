import 'package:dicoding_flutter_submission/models/club_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final ClubModel club;

  DetailScreen({this.club});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[300],
        title: Text('Club Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[50],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 26.0,
                  ),
                ],
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.height * 0.15,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(club.strTeamBadge),
                      ),
                    ),
                  ),
                  Text(
                    club.strTeam,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[50],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 26.0,
                  ),
                ],
                shape: BoxShape.rectangle,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Website :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(club.strWebsite),
                  SizedBox(height: 5),
                  Text(
                    'Facebook :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(club.strFacebook),
                  SizedBox(height: 5),
                  Text(
                    'Instagram :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(club.strInstagram),
                  SizedBox(height: 5),
                  Text(
                    'Twitter :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(club.strTwitter),
                  SizedBox(height: 5),
                  Text(
                    'League :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(club.strLeague),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[50],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 26.0,
                  ),
                ],
                shape: BoxShape.rectangle,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'About Club :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    club.strDescriptionEN,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
