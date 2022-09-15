import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/class.dart';
import '../Models/cup.dart';

class FirebaseHelper{
  static Future<List<Cup>> getCups() async{
      List<Cup> cupsList = [];
      final querySnapshot =
      await FirebaseFirestore.instance.collection('Cup').get();
      //.
      for (var cupDoc in querySnapshot.docs.toList()) {
        Cup cup = Cup(cupDoc.get('name'));
        Map classes = cupDoc.get('classes');

        for(var clas in classes.keys) {
          List<String> teams = (classes[clas] as List).map((item) => item as String).toList();
          cup.categories.add(Class(clas, teams));
        }
        /*
        var categories = Map<String, dynamic>.from(cupDoc.get('categories'));
        for (var category in categories.entries) {
          c.category = category.key;
          c.categories[category.key] = Category(category.key);
          for (var group in category.value) {
            c.categories[category.key]?.groups[group] = Group(group);
          }
        }
        cupsList.add(c);
      }*/
        cupsList.add(cup);
    }
      return cupsList;
  }
}