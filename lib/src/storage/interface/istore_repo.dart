import 'serializable.dart';

abstract interface class IStoreRepo<T extends Serializable> {
  Future<void> save(T data);
  Future<void> clear();
  Future<T?> fetch();
}
