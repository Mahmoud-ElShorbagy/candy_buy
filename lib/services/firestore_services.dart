import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreServices {
  // ليكون الكونستراكتور عباره عن برايفت ليتم عمل اوبجكت داخل الكلاس
  FirestoreServices._();
  static final instance = FirestoreServices._();
  final _fireStore = FirebaseFirestore.instance;
  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    final reference = _fireStore.doc(path);
    debugPrint("Request Data: $data");
    await reference.set(data);
  }

  Future<void> deleteDate({required String path}) async {
    final reference = _fireStore.doc(path);
    debugPrint("delete Data: $path");
    await reference.delete();
  }

  Stream<T> documentStream<T>(
      {required String path,
      required T Function(Map<String, dynamic>? data, String documentId)
          builder}) {
    final reference = _fireStore.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _fireStore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    // ignore: non_constant_identifier_names
    return snapshots.map((Snapshot) {
      final result = Snapshot.docs
          .map((snapshot) =>
              builder(snapshot.data() as Map<String, dynamic>?, snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}
