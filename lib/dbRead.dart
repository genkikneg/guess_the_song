import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dbread {
  //インスタンス化
  final db = FirebaseFirestore.instance;

  //
  //読出し
  //
  Future<String> read() async {
    try {
      //ドキュメントの取得
      final docRef = db.collection('MrsGreenApple').doc('青と夏');

      const source = Source.cache;

      DocumentSnapshot doc = await docRef.get(const GetOptions(source: source));

      final data = doc.data() as Map<String, dynamic>;

      String lyrics = data['歌詞'] ?? '';

      return lyrics;
    } catch (e) {
      debugPrint('error: $e');
      rethrow;
    }
  }
}
