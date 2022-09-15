import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class FileHelper{
  static Future<void> openFileExplorer() async {
    var paths;
    FileType pickingType = FileType.custom;
    String? extension = "csv";
    try {
      paths = (await FilePicker.platform.pickFiles(
        type: pickingType,
        allowMultiple: false,
        allowedExtensions: (extension.isNotEmpty)
            ? extension.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    openFile2(paths.first);
  }

  static Future<void> openFile2(file) async {
    final input =  File(file.path).openRead();
    final matches = await input.transform(utf8.decoder).transform(CsvToListConverter()).toList();
    for (var match in matches) {
        Map team1 = Map();
        team1['name'] = match[0];
        Map team2 = Map();
        team2['name'] = match[1];
        FirebaseFirestore.instance.collection('Match').doc().set({
          'team1': team1,
          'team2': team2,
          'class': 'Aspirantes',
          'cup': 'NqnNK2wZDuRBjYNVB2HW',
          'round': match[2],
        });

    }
    return;
  }
}