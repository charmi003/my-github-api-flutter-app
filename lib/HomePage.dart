import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url='https://api.github.com/users';
  List data=[];
  var isLoading=true;

  //* AS SOON AS THE APPLICATION LOADS
  @override
  void initState(){
    super.initState();
    getJsonData();
  } 

  Future getJsonData() async{
    var response= await http.get(Uri.parse(url));
    // print(response.body);
    setState(() {
      var convertDataToJson=json.decode(response.body);
      data=convertDataToJson;
      // print(data);
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Github Api App'),
      ),
      body:isLoading ? Center(child: Text('Loading...',style:TextStyle(fontSize:20))) : ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context,idx)=> Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title:Text(data[idx]["login"], style:TextStyle(fontSize: 20)),
            subtitle:InkWell(
                child: Text(data[idx]["url"].toString(), style:TextStyle(color:Colors.blue)),
                onTap: () => launch(data[idx]["url"])
            ),
          ),
        ),
      )
      
    );
  }
}