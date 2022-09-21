import 'dart:core';

class TeamStats extends Comparable {
  String name = '';
  int points = 0;
  int games = 0;
  int wins = 0;
  int draws = 0;
  int loses = 0;
  int goalsPro = 0;
  int goalsCon = 0;
  int goalsDif = 0;

  TeamStats(this.name, this.points, this.games, this.wins, this.draws,
      this.loses, this.goalsPro, this.goalsCon, this.goalsDif);

  TeamStats.empty();

  @override
  int compareTo(other) {
    if (this.points.compareTo(other.points) != 0) {
      return this.points.compareTo(other.points);
    } else if (this.wins.compareTo(other.wins) != 0) {
      return this.wins.compareTo(other.wins);
    } else if (this.goalsDif.compareTo(other.goalsDif) != 0) {
      this.goalsDif.compareTo(other.goalsDif);
    } else if (this.goalsPro.compareTo(other.goalsPro) != 0) {
      this.goalsPro.compareTo(other.goalsPro);
    }
    return 0;
  }
}
