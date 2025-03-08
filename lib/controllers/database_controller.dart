import 'package:candy_buy/models/product_dto.dart';
import 'package:candy_buy/models/user_data.dart';
import 'package:candy_buy/services/firestore_services.dart';
import 'package:candy_buy/utilities/api_path.dart';

abstract class Database {
  Stream<List<ProductDTO>> productStream();
  Future<void> setUserData(UserData userData);
}

class FireStoreDatabase implements Database {
  final String uid;
  final _services = FirestoreServices.instance;
  FireStoreDatabase({required this.uid});
  @override
  Stream<List<ProductDTO>> productStream() => _services.collectionsStream(
        path: ApiPath.products(),
        builder: (data, documentid) => ProductDTO.fromMap(data!, documentid),
      );

  @override
  Future<void> setUserData(UserData userData) async => await _services.setData(
      path: ApiPath.user(userData.uid), data: userData.toMap());
}
