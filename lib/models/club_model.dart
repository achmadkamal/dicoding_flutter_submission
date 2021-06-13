class ClubModel {
  String strTeamBadge;
  String strTeam;
  String strLeague;
  String strWebsite;
  String strFacebook;
  String strTwitter;
  String strInstagram;
  String strDescriptionEN;

  ClubModel({
    this.strTeamBadge,
    this.strTeam,
    this.strLeague,
    this.strWebsite,
    this.strFacebook,
    this.strTwitter,
    this.strInstagram,
    this.strDescriptionEN,
  });

  factory ClubModel.fromJson(Map<String, dynamic> json) {
    return ClubModel(
      strTeamBadge: json['strTeamBadge'],
      strTeam: json['strTeam'],
      strLeague: json['strLeague'],
      strWebsite: json['strWebsite'],
      strTwitter: json['strTwitter'],
      strFacebook: json['strFacebook'],
      strInstagram: json['strInstagram'],
      strDescriptionEN: json['strDescriptionEN'],
    );
  }
}
