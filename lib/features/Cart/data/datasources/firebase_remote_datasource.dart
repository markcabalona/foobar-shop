import 'dart:developer';

import 'package:foobar_shop/core/errors/exceptions.dart';
import 'package:foobar_shop/core/mixins/firebase_handler_mixin.dart';
import 'package:foobar_shop/features/Cart/data/datasources/remote_datasource.dart';
import 'package:foobar_shop/features/Cart/data/models/product_model.dart';

class RemoteCartDataSourceImpl
    with FirestoreHandlerMixin
    implements RemoteCartDataSource {
  @override
  Future<List<ProductModel>> fetchProducts() {
    return firestoreHandler(
      request: () async {
        final productsCollection = await firestore.collection('products').get();
        return productsCollection.docs
            .map(
              (e) => ProductModel.fromMap(
                e.data()..addEntries({'id': e.id}.entries),
              ),
            )
            .toList();
      },
      onFailure: (error) {
        log(error.message ?? error.code);
        throw CartException(message: error.message ?? error.code);
      },
    );
  }
}
