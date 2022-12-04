import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Item  {
  String name;
  String url;
  Item(this.name,this.url);
  Future<void> getData() async {
    Response response = await get ('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    print(data);

  }

}