/*import 'package:flutter_secure_storage/flutter_secure_storage.dart';//storing token key

class StoreTokenKey{

  final secureStore = new FlutterSecureStorage();

  void setSecureKey(String key, String data) async {
    print("i am getting: "+data);
    await secureStore.write(key: key, value: data);
  }

  void getSecureKey(String key, Function callback) async {
    String myPassword = await secureStore.read(key: key);
    print("the key is: "+myPassword);
    await secureStore.read(key: key).then(callback);
  }

}*/