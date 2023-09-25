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
  String _responseGet = "None";
  String _responsePost = "None";
  TextEditingController _id = TextEditingController(text:"aaa");
  TextEditingController _pw = TextEditingController(text:"123");
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
            http_get(),
            http_post(context),

            FloatingActionButton(child: Text("put"), onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Container http_post(BuildContext context) {
    return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Column(
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
                ),
                FloatingActionButton(child: Text("post"), onPressed: () async {
                  final vResult = await server.postReq(_id.text, _pw.text) ;
                  setState(() {
                    _responsePost = vResult.toString();
                  });
                }),
                AutoSizeText("Http_Post \n" + _responsePost),
              ],
            ),
          );
  }

  Container http_get() {
    return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(child: Text("get"), onPressed: () async {
                  final vResult = await server.getReq() ;
                  setState(() {
                    _responseGet = vResult.toString();
                  });
                }),
                AutoSizeText("Http_get \n" + _responseGet,maxLines: 4),
              ],
            ),
          );
  }
}
