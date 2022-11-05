import 'dart:io';

class Utils {
  static Future<bool> checkInternetConnections() async {
    bool isConnect = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty) {
        isConnect = true;
      }
    } on SocketException catch (_) {
      isConnect = false;
    }
    return isConnect;
  }

  static generateKeyword(fullName) {
    List<String> listaProcura = [];
    String temp = "";
    for (var i = 0; i < fullName.length; i++) {
      if (fullName[i] == "") {
        temp = "";
      } else {
        temp = temp + fullName[i];
        listaProcura.add(temp);
      }
    }
    return listaProcura;
  }
}
