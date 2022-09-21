import 'package:esporte_amador/Models/team_stats.dart';
import '../Models/class.dart';
import '../Models/game.dart';

class SoccerHelper {
  static List<TeamStats> getLeaderboardFromGames(
      List<Game> games, Class clas) {
    Map<String, TeamStats> leaderboardMap = {};
    List<TeamStats> leaderboard = [];
    for (String team in clas.teams) {
      leaderboardMap[team] = TeamStats.empty();
    }
    for (Game game in games) {
      if (game.team1.goals != null && game.clas == clas.name) {
        int goals1 = game.team1.goals!;
        int goals2 = game.team2.goals!;
        leaderboardMap[game.team1.name]!.games++;
        leaderboardMap[game.team1.name]!.goalsPro = goals1;
        leaderboardMap[game.team1.name]!.goalsCon = goals2;
        leaderboardMap[game.team2.name]!.games++;
        leaderboardMap[game.team2.name]!.goalsPro = goals2;
        leaderboardMap[game.team2.name]!.goalsCon = goals1;
        if (goals1 > goals2) {
          leaderboardMap[game.team1.name]!.wins++;
          leaderboardMap[game.team2.name]!.loses++;
        } else if (goals1 == goals2) {
          leaderboardMap[game.team1.name]!.draws++;
          leaderboardMap[game.team2.name]!.draws++;
        } else {
          leaderboardMap[game.team1.name]!.loses++;
          leaderboardMap[game.team2.name]!.wins++;
        }
      }
    }

    leaderboardMap.forEach((key, value) {
      value.name = key;
      value.points = value.wins * 3 + value.draws;
      value.goalsDif = value.goalsPro - value.goalsCon;
    });

    leaderboardMap.forEach((k, v) => leaderboard.add(v));
    leaderboard.sort((a, b) => b.compareTo(a));

    return leaderboard;
  }
}
