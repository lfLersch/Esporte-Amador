import 'package:flutter/material.dart';

import '../Screens/leaderboard_screen.dart';
import '../Screens/matches_screen.dart';

class CupPage extends StatefulWidget {
  static const id = 'CupPage';
  const CupPage({Key? key}) : super(key: key);

  @override
  State<CupPage> createState() => _CupPageState();
}

class _CupPageState extends State<CupPage> {
  final ScrollController _leaderboardController = ScrollController();
  final ScrollController _matchesController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('Copa'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Classificação'),
              Tab(text: 'Tabela'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LeaderboardScreen(),
            MatchesScreen(),
          ],
        ),
      ),
    );
  }
}
