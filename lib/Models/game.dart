import 'package:esporte_amador/Models/game_team.dart';

class Game{
  GameTeam team1;
  GameTeam team2;
  String round;
  String clas;

  Game(this.team1, this.team2, this.round, this.clas);
}