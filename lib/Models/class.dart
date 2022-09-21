import 'package:esporte_amador/Models/team_stats.dart';

import 'game.dart';

class Class{
  String name;
  List<String> teams;
  List<Game> games = [];
  List<TeamStats> leaderboard = [];

  Class(this.name, this.teams);

}