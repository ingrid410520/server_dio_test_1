import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:server_dio_test_1/server.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _response = "None";
  TextEditingController _http =
      TextEditingController(text: "http://localhost:");
  TextEditingController _id = TextEditingController(text: "aaa");
  TextEditingController _pw = TextEditingController(text: "123");
  TextEditingController _score = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            build_SetHttp(context),
            http_post(context),
            build_SendScore(context),
            build_ShowResponse(context),

            //FloatingActionButton(child: Text("put"), onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Container build_ShowResponse(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.15,
      child: AutoSizeText("response \n" + _response, maxLines: 4),
    );
  }

  Container build_SendScore(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            decoration: InputDecoration(label: Text("Score")),
            controller: _score,
          ),
          ElevatedButton.icon(
            label: Text("Send"),
            icon: Icon(Icons.send),
            onPressed: () async {
              // final vResult = await server.postReq(_score.text);
              // setState(() {
              //   _response = vResult.toString();
              // });
            },
          )
        ],
      ),
    );
  }

  Container build_SetHttp(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            decoration: InputDecoration(label: Text("HTTP")),
            controller: _http,
          ),
          ElevatedButton.icon(
            label: Text("Save"),
            icon: Icon(Icons.http),
            onPressed: () {
              setState(() {
                server.SetHttp(_http.text);
              });
            },
          )
        ],
      ),
    );
  }

  Container http_post(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              TextField(
                decoration: InputDecoration(label: Text("ID")),
                controller: _id,
              ),
              TextField(
                decoration: InputDecoration(label: Text("Password")),
                controller: _pw,
              ),
            ],
          ),
          FloatingActionButton(
              child: Text("post"),
              onPressed: () async {
                final vResult = await server.postReq(_id.text, _pw.text);
                setState(() {
                  _response = vResult.toString();
                });
              }),
          //AutoSizeText("Http_Post \n" + _response, maxLines: 3),
        ],
      ),
    );
  }

  Container http_get() {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
              child: Text("get"),
              onPressed: () async {
                //final vResult = await server.getReq();
                setState(() {});
              }),
          //AutoSizeText("Http_get \n" + _responseGet, maxLines: 4),
        ],
      ),
    );
  }
}
