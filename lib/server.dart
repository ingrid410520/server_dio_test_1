import 'package:dio/dio.dart';

// const _API = "https://jsonplaceholder.typicode.com/posts/1";
String strHttp = "http://localhost:5092/WeatherForecast";

class MyServer {
  void SetHttp(String _strHttp){
    strHttp = _strHttp;

  }
  Future<String> getReq() async {
    Dio vDio = new Dio();
    Response vRes = await vDio.get(strHttp);
    print(vRes.data.toString());

    return vRes.data.toString();
  }

  Future<String> postReq(String strID, String strPW) async {
    Dio vDio = new Dio();
    //Response vRes = await vDio.post(_API, data: { "_id" : strID, "_pw" : strPW});
    Response vRes = await vDio.post(strHttp, queryParameters: { "_id" : strID, "_pw" : strPW});
    //Response vRes = await vDio.post(_API);
    print(vRes.data.toString());

    return vRes.data.toString();
  }


  Future<String> getReqQuery() async {
    Dio vDio = new Dio();
    Response vRes = await vDio.get(strHttp, queryParameters: {
      "userID" : 1,
      "id" : 2,
    });
    print(vRes.data.toString());

    return vRes.data.toString();
  }

}

MyServer server = MyServer();