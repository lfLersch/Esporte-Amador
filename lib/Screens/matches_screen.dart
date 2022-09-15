import 'package:flutter/material.dart';

import '../Helper/file_helper.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black38,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 30.0, right: 30.0, top: 10, bottom: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.black87,
                child: Center(
                  child: Text(
                    '1ª Rodada',
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.black38,
              ),
              MatchContainer(),
              Container(
                height: 1,
                color: Colors.black38,
              ),
              MatchContainer(),
              Container(
                height: 1,
                color: Colors.black38,
              ),
              MatchContainer(),
              Container(
                height: 1,
                color: Colors.black38,
              ),
              MatchContainer(),
              Container(
                height: 1,
                color: Colors.black38,
              ),
              MatchContainer(),
              Container(
                height: 1,
                color: Colors.black38,
              ),
              MatchContainer(),
              Container(
                height: 1,
                color: Colors.black38,
              ),
              MatchContainer(),
              Container(
                height: 1,
                color: Colors.black38,
              ),
              MatchContainer(),
              Container(
                height: 1,
                color: Colors.black38,
              ),
              MatchContainer(),
              Container(
                height: 1,
                color: Colors.black38,
              ),
              MatchContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class MatchContainer extends StatelessWidget {
  const MatchContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Text('Duvidosa',
                style: TextStyle(fontSize: 20, color: Colors.white70)),
          ),
          Center(
            child: (Text(
              '1 x 1',
              style: TextStyle(fontSize: 20, color: Colors.white70),
            )),
          ),
          Expanded(
            child: Text('Cecília',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20, color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}
