import 'package:esporte_amador/Models/team_stats.dart';

import 'class.dart';
import 'game.dart';

class Cup{
  String id;
  String name;
  List<Class> categories = [];

  Cup(this.id, this.name);

  addGames(List<Game> games){
    for(Class category in categories){
      category.games.clear();
    }
    for(Game game in games){
      for(Class category in categories){
        if(game.clas == category.name){
          category.games.add(game);
        }
      }
    }
    for(Class category in categories){
      category.games.sort((a, b) {
        return a.round.compareTo(b.round);
      },);
    }
  }

  addLeaderboard(List<TeamStats> teamStats){
    for(Class category in categories){
      category.leaderboard = teamStats;
    }
  }
}