import 'package:dio/dio.dart';

class NetworkManager {
  //singleton
  static NetworkManager? _instace;
  static NetworkManager get instance {
    _instace ??= NetworkManager._init();
    return _instace!;
  }

  late Dio dio;
  final baseUrl = "https://kayit.turkecon.org/api";
  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }
}
