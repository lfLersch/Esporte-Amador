import 'package:esporte_amador/Models/team_stats.dart';
import 'package:flutter/material.dart';

import '../Models/class.dart';

class LeaderboardScreen extends StatefulWidget {
  final List<Class> categories;
  const LeaderboardScreen({Key? key, required this.categories})
      : super(key: key);

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  int category = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              color: Colors.black54,
              child: DataTable(
                  columnSpacing: 20,
                  columns: const [
                    DataColumn(
                        label: Text(
                      'Time',
                      style: TextStyle(color: Colors.white70),
                    )),
                    DataColumn(
                        label: Text(
                      'P',
                      style: TextStyle(color: Colors.white70),
                    )),
                    DataColumn(
                        label: Text(
                      'J',
                      style: TextStyle(color: Colors.white70),
                    )),
                    DataColumn(
                        label: Text(
                      'V',
                      style: TextStyle(color: Colors.white70),
                    )),
                    DataColumn(
                        label: Text(
                      'E',
                      style: TextStyle(color: Colors.white70),
                    )),
                    DataColumn(
                        label: Text(
                      'D',
                      style: TextStyle(color: Colors.white70),
                    )),
                    DataColumn(
                        label: Text(
                      'GP',
                      style: TextStyle(color: Colors.white70),
                    )),
                    DataColumn(
                        label: Text(
                      'GC',
                      style: TextStyle(color: Colors.white70),
                    )),
                    DataColumn(
                        label: Text(
                      'SG',
                      style: TextStyle(color: Colors.white70),
                    )),
                  ],
                  rows: buildRows()),
            ),
          ),
        ],
      ),
    );
  }

  buildRows() {
    List<DataRow> leaderboardRows = [];
    for (TeamStats team in widget.categories[category].leaderboard) {
      leaderboardRows.add(
        DataRow(cells: [
          DataCell(Text(team.name, style: TextStyle(color: Colors.white70),)),
          DataCell(Text(
            team.points.toString(),
            style: TextStyle(color: Colors.white70),
          )),
          DataCell(Text(
            team.games.toString(),
            style: TextStyle(color: Colors.white70),
          )),
          DataCell(Text(
            team.wins.toString(),
            style: TextStyle(color: Colors.white70),
          )),
          DataCell(Text(
            team.draws.toString(),
            style: TextStyle(color: Colors.white70),
          )),
          DataCell(Text(
            team.loses.toString(),
            style: TextStyle(color: Colors.white70),
          )),
          DataCell(Text(
            team.goalsPro.toString(),
            style: TextStyle(color: Colors.white70),
          )),
          DataCell(Text(
            team.goalsCon.toString(),
            style: TextStyle(color: Colors.white70),
          )),
          DataCell(Text(
            team.goalsDif.toString(),
            style: TextStyle(color: Colors.white70),
          )),
        ]),
      );
    }
    return leaderboardRows;
  }
}
