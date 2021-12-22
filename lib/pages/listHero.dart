import 'package:dota2heroes/pages/detailhero.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class listHero extends StatefulWidget {
  final String role;

  const listHero(
    { Key? key,
      required this.role
    }
    ) : super(key: key);

  @override
  _listHeroState createState() => _listHeroState();
}

class _listHeroState extends State<listHero> {
  List _heroes = [];
  List _filteredheroes = [];
  late TabController _controller;

  String _similarImg1 = "",_similarImg2 = "",_similarImg3 = "";
  String _similarName1 = "",_similarName2 = "",_similarName3 = "";

  
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/dota2.json');
    final data = await json.decode(response);
    setState(() {
      _heroes = data;
    });

    if(widget.role == ''){
      _filteredheroes = _heroes;
    }else{
      for(int index = 0; index < _heroes.length ; index++){
        if(_heroes[index]["roles"].join('').contains(widget.role)){
          _filteredheroes.add(_heroes[index]);
        }
      }
    }
  }


  Future<void> SimilarHeroPicker(int index) async {    
    if(_filteredheroes[index]["primary_attr"] == "agi"){
      _similarImg1 = '/apps/dota2/images/dota_react/heroes/meepo.png?';
      _similarName1 = 'Meepo';
      _similarImg2 = '/apps/dota2/images/dota_react/heroes/naga_siren.png?';
      _similarName2 = 'Naga Siren';
      _similarImg3 = '/apps/dota2/images/dota_react/heroes/luna.png?';
      _similarName3 = 'Luna';
    }else if(_filteredheroes[index]["primary_attr"] == "str"){
      _similarImg1 = '/apps/dota2/images/dota_react/heroes/treant.png?';
      _similarName1 = 'Treant Protector';
      _similarImg2 = '/apps/dota2/images/dota_react/heroes/chaos_knight.png?';
      _similarName2 = 'Chaos Knight';
      _similarImg3 = '/apps/dota2/images/dota_react/heroes/pudge.png?';
      _similarName3 = 'Pudge';
    }else if(_filteredheroes[index]["primary_attr"] == "int"){
      _similarImg1 = '/apps/dota2/images/dota_react/heroes/shadow_shaman.png?';
      _similarName1 = 'Shadow Shaman';
      _similarImg2 = '/apps/dota2/images/dota_react/heroes/zuus.png?';
      _similarName2 = 'Zeus';
      _similarImg3 = '/apps/dota2/images/dota_react/heroes/ogre_magi.png?';
      _similarName3 = 'Ogre Magi';
    }
  }

  void initState(){
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => readJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: 
      Padding(padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                _filteredheroes.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: _filteredheroes.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Color.fromARGB(255, 61, 61, 61),
                              margin: const EdgeInsets.all(10),
                              child: ListTile(
                                onTap: () {
                                  SimilarHeroPicker(index);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => 
                                  detailhero(
                                    heroName: _filteredheroes[index]["localized_name"],
                                    heroImg: _filteredheroes[index]["img"],
                                    heroRoles: _filteredheroes[index]["roles"].join(' - '),
                                    heroType: _filteredheroes[index]["attack_type"],
                                    heroAttack: _filteredheroes[index]["base_attack_max"],
                                    heroHealth: _filteredheroes[index]["base_health"],
                                    heroMspd: _filteredheroes[index]["move_speed"],
                                    heroAttr: _filteredheroes[index]["primary_attr"],
                                    simiImg1: _similarImg1,
                                    simiName1: _similarName1,
                                    simiImg2: _similarImg2,
                                    simiName2: _similarName2,
                                    simiImg3: _similarImg3,
                                    simiName3: _similarName3,
                                    ))
                                  );
                                },
                                textColor: Colors.white,
                                isThreeLine: true,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Image.network('https://api.opendota.com' + _filteredheroes[index]["img"])
                                  ),
                                title: Text(_filteredheroes[index]["localized_name"]),
                                subtitle: Text(_filteredheroes[index]["roles"].join(' ') + 
                                '\n' + _filteredheroes[index]["primary_attr"]),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: 
                          Column(
                            children: [
                              Text('ERROR',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                              ),),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text('Cant reach API',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                              ),),
                              SizedBox(
                                height: 5.0,
                              ),
                              FlatButton(
                                onPressed: initState, 
                                color: Colors.red[900],
                                child: Text('Retry',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),))
                            ],)
                          
                    )
              ],
            ),
          )
    );
  }
}