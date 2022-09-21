import 'package:flutter/material.dart';
import '../Models/class.dart';
import '../Models/game.dart';

class GamesScreen extends StatefulWidget {
  final List<Class> categories;
  const GamesScreen({Key? key, required this.categories}) : super(key: key);

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  int category = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black38,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10, bottom: 10),
          child: Column(
            children: [
              DropdownButton(items: widget.categories.map<DropdownMenuItem<String>>((Class value) {
                return DropdownMenuItem<String>(
                  value: value.name,
                  child: Text(value.name),
                );
              }).toList(), onChanged: (value){
                setState((){
                  category = widget.categories.indexWhere((element) => element.name == value);
                });
              }),
              Column(
                children:
                  buildGamesContainer()
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildGamesContainer(){
    List<Widget> table = [];
    String round = widget.categories[category].games[0].round;
    table.add(buildRoundContainer(round),);
    for(Game game in widget.categories[category].games){
      if(game.round != round){
        table.add(buildRoundContainer(game.round),);
      }
      table.add(GameContainer(game: game));
      round = game.round;
    }
    return table;
  }

  Container buildRoundContainer(String round) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        color: Colors.black87,
        child: Center(
          child: Text(
            round,
            style: const TextStyle(fontSize: 20, color: Colors.white70),
          ),
        ),
      );
  }
}

class GameContainer extends StatelessWidget {
  final Game game;
  const GameContainer({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(game.team1.name,
                style: TextStyle(fontSize: 19, color: Colors.white70)),
          ),
          Center(
            child: Row(
              children: [
                Text(
                  (game.team1.goals == null)
                      ? ''
                      : game.team1.goals!.toString(),
                  style: TextStyle(fontSize: 19, color: Colors.white70),
                ),
                Text(
                  ' x ',
                  style: TextStyle(fontSize: 19, color: Colors.white70),
                ),
                Text(
                  (game.team1.goals == null)
                      ? ''
                      : game.team2.goals!.toString(),
                  style: TextStyle(fontSize: 19, color: Colors.white70),
                )
              ],
            ),
          ),
          Expanded(
            child: Text(game.team2.name,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 19, color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}
