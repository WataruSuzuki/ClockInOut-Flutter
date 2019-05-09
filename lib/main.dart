import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _makePostRequest();
    });
  }

  _makeGetRequest() async {

    // make request
    Response response = await get('https://jsonplaceholder.typicode.com/posts');

    // sample info available in response
    int statusCode = response.statusCode;
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json = response.body;

    // TODO convert json to object...

  }

  _makePostRequest() async {

    // set up POST request arguments
    String url = '<見せられないよ \(・∀・)/>';
//    String url = 'https://jsonplaceholder.typicode.com/posts';
//    Map<String, String> headers = {"Content-type": "application/json"};
//    String json = '{"title": "Hello", "body": "body text", "userId": 1}';

    // make POST request
    Response response = await post(url);
    //Response response = await post(url, headers: headers, body: json);

    // check the status code for the result
    int statusCode = response.statusCode;

    // this API passes back the id of the new item added to the body
    String body = response.body;
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }
    print('statusCode = $statusCode');
    print('body = $body');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
