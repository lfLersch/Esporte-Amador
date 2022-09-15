import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Time')),
            DataColumn(label: Text('P')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('a')),
              DataCell(Text('a')),
            ]),
            DataRow(cells: [
              DataCell(Text('a')),
              DataCell(Text('a')),
            ]),
          ],
        ),
      ),
    );
  }
}
