import 'package:esporte_amador/Helper/firebase_helper.dart';
import 'package:esporte_amador/Pages/cup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../Models/cup.dart';

class HomePage extends StatefulWidget {
  static const id = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FutureBuilder(
        future: FirebaseHelper.getCups(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildCupsList(snapshot.data!);
          }
          return buildLoadingContainer();
        },
      ),
    ));
  }

  Widget buildCupsList(List<Cup> cups) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 150,),
            Image.asset('images/logoball.png',height: 100),
            Text('Futebol\nnos vales', style: TextStyle(fontSize: 50, color: Colors.teal.shade900, height: 1), textAlign: TextAlign.center),
            SizedBox(height: 25,),
            SizedBox(height: 25,),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: cups.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CupPage.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10)
                      ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cups[index].name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              Text('Titulares/Aspirantes', style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoadingContainer() {
    return Container();
  }
}
