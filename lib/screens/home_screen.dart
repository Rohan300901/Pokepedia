import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pokepedia = [];
  var pokepediaAPI = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  void initState(){
    fetchData();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;

    return  Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
              right: -50,
              child: Image.asset(
              "assets/images/pokeball.png",
                width: 200,
              fit: BoxFit.fitHeight,
          )
          ),
          Positioned(
            top: 100,
          left: 15,
          child: Text("Poke'pedia",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
          ),
          Positioned(
            top: 160,
              bottom: 0,
              width: width,
              child: Column(
                children: [
                  pokepedia!=null?
                      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,childAspectRatio: 1.4),
                          itemCount: pokepedia.length,
                          itemBuilder: (context,index){
                        var type = pokepedia[index]['type'][0];
                        return Card(
                          child: Text(pokepedia[index]['name']),
                        );

              },
                      ):Center(child: CircularProgressIndicator()),

                ],
              )
          )
        ],
      )



    );
  }
  void fetchData(){
    var url = Uri.https("raw.githubusercontent.com","Biuni/PokemonGO-Pokedex/master/pokedex.json");
    print(url);
    http.get(url).then((value) {
      print(value.body);
      if(value.statusCode == 200){
        var decodeData = jsonDecode(value.body);
        pokepedia = decodeData["pokemon"];
      }
    });
  }

}
