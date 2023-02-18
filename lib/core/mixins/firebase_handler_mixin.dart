import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

mixin FirestoreHandlerMixin {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<ReturnType> firestoreHandler<ReturnType>({
    required Future<ReturnType> Function() request,
    required dynamic Function(FirebaseException error) onFailure,
  }) async {
    try {
      return request();
    } on FirebaseException catch (e) {
      return onFailure(e);
    } catch (e) {
      log(name: 'FirebaseHandlerMixin: ', e.toString());
      rethrow;
    }
  }
}
