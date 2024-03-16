import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class feedWidget extends StatefulWidget {
  const feedWidget({
    super.key,
  });

  @override
  State<feedWidget> createState() => _feedWidgetState();
}

const String API_Key = "ZwkVmvPKRmmvbgHmnUZPMZkLgU_ikcelfJ9bGR9mMtc";
const String url = 'https://api.unsplash.com/photos/?client_id=$API_Key';
Uri uri = Uri.parse(url);

class _feedWidgetState extends State<feedWidget> {
  List? data = [];
  List<String>? imageUrl = [];
  List<String>? imageDesc = [];

  getData() async {
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        setState(
          () {
            data = json.decode(response.body);
            getValues();
          },
        );
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  getValues() {
    for (int i = 0; i < data!.length; i++) {
      imageUrl?.add(data?.elementAt(i)['urls']['regular']);
      imageDesc?.add(data?.elementAt(i)['description'] ?? "");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121139),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/HomeScreenBackground.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.white,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Image(
                      image: NetworkImage(imageUrl![index]),
                    ),
                    Text(
                      imageDesc![index],
                    ),
                  ],
                ));
          },
          itemCount: data!.length,
        ),
      ),
    );
  }
}
