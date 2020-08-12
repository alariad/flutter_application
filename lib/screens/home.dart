import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List data;
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = json.decode(response.body);
    });
    print(data[1]["title"]);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 14,
          backgroundColor: Colors.white60,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("JSON Data", style: TextStyle(
                fontSize: 23.0,
                color: Colors.black,
              ),),
              Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.person,
                      color:Colors.black),
                    iconSize: 30,
                    onPressed: () => Navigator.pushNamed(context, '/SignIn'),),
                  GestureDetector(
                    onTap: () => {Navigator.pushNamed(context, '/SignIn')},
                    child: Text("Sign Out", style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),),
                  ),
                ],
              )
            ],
          ),

        ),
        body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              elevation: 14.0,
                margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        data[index]["title"],
                        style: TextStyle(
                          fontSize: 23.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        data[index]["body"],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                )
            );},
        )
      )
      );
  }
}

