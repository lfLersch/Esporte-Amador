import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esporte_amador/Models/game_team.dart';
import 'package:esporte_amador/Models/game.dart';
import '../Models/class.dart';
import '../Models/cup.dart';

class FirebaseHelper{
  static Future<List<Cup>> getCups() async{
      List<Cup> cupsList = [];
      final querySnapshot =
      await FirebaseFirestore.instance.collection('Cup').get();
      //.
      for (var cupDoc in querySnapshot.docs.toList()) {
        Cup cup = Cup(cupDoc.id, cupDoc.get('name'));
        Map classes = cupDoc.get('classes');

        for(var clas in classes.keys) {
          List<String> teams = (classes[clas] as List).map((item) => item as String).toList();
          cup.categories.add(Class(clas, teams));
        }
        cupsList.add(cup);
    }
      return cupsList;
  }

  static Future<List<Game>> getGames(String id) async {
    List<Game> games = [];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('Match')
        .where('cup', isEqualTo: id)
        .get();
    for (var gameDoc in querySnapshot.docs.toList()) {
      GameTeam team1 = GameTeam(gameDoc.get('team1')['name'], gameDoc.get('team1')['goals']);
      GameTeam team2 = GameTeam(gameDoc.get('team2')['name'], gameDoc.get('team2')['goals']);
      Game game = Game(team1, team2, gameDoc.get('round'), gameDoc.get('class'));
      games.add(game);
    }
    return games;
  }
}