import 'package:dio/dio.dart';

// const _API = "https://jsonplaceholder.typicode.com/posts/1";
const _API = "http://localhost:5092/WeatherForecast";

class MyServer {
  Future<String> getReq() async {
    Dio vDio = new Dio();
    Response vRes = await vDio.get(_API);
    print(vRes.data.toString());

    return vRes.data.toString();
  }

  Future<String> postReq(String strID, String strPW) async {
    Dio vDio = new Dio();
    Response vRes = await vDio.post(_API);
    print(vRes.data.toString());

    return vRes.data.toString();
  }

  Future<String> getReqQuery() async {
    Dio vDio = new Dio();
    Response vRes = await vDio.get(_API, queryParameters: {
      "userID" : 1,
      "id" : 2,
    });
    print(vRes.data.toString());

    return vRes.data.toString();
  }

}

MyServer server = MyServer();