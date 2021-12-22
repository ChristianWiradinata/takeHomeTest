import 'package:flutter/material.dart';

class detailhero extends StatelessWidget {
  final String heroName;
  final String heroImg;
  final String heroRoles;
  final String heroType;
  final int heroAttack;
  final int heroHealth;
  final int heroMspd;
  final String heroAttr;
  final String simiImg1, simiImg2, simiImg3;
  final String simiName1, simiName2, simiName3;

  detailhero({ Key? key, 
  required this.heroName,  
  required this.heroImg,
  required this.heroRoles,
  required this.heroType,
  required this.heroAttack,
  required this.heroHealth,
  required this.heroMspd,
  required this.heroAttr,
  required this.simiImg1,
  required this.simiName1,
  required this.simiImg2,
  required this.simiName2,
  required this.simiImg3,
  required this.simiName3,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text(heroName)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(minWidth: 100, maxWidth: 600),
              child: Image.network('https://api.opendota.com' + heroImg),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              clipBehavior: Clip.antiAlias,
              color: Color.fromARGB(255, 61, 61, 61),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Roles",
                            style: TextStyle(
                              color: Color.fromARGB(255, 82, 82, 82),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0
                          ),
                          Text(
                            heroRoles,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                            ),
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              clipBehavior: Clip.antiAlias,
              color: Color.fromARGB(255, 61, 61, 61),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Attack Type",
                            style: TextStyle(
                              color: Color.fromARGB(255, 82, 82, 82),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0
                          ),
                          Text(
                            heroType,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white
                            ),
                          )
                        ],
                      )
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Max. Atk",
                            style: TextStyle(
                              color: Color.fromARGB(255, 82, 82, 82),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            heroAttack.toString(),
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ),Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Health",
                            style: TextStyle(
                              color: Color.fromARGB(255, 82, 82, 82),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            heroHealth.toString(),
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ),Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "MSPD",
                            style: TextStyle(
                              color: Color.fromARGB(255, 82, 82, 82),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            heroMspd.toString(),
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ),Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Attr",
                            style: TextStyle(
                              color: Color.fromARGB(255, 82, 82, 82),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            heroAttr.toString(),
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Similar Hero",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white
              ),
            ),
            Card(
              color: Color.fromARGB(255, 61, 61, 61),
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  textColor: Colors.white,
                  leading: Image.network('https://api.opendota.com' + simiImg1),
                  title: Text(simiName1),
                ),
            ),
            Card(
              color: Color.fromARGB(255, 61, 61, 61),
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  textColor: Colors.white,
                  leading: Image.network('https://api.opendota.com' + simiImg2),
                  title: Text(simiName2),
                ),
            ),
            Card(
              color: Color.fromARGB(255, 61, 61, 61),
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  textColor: Colors.white,
                  leading: Image.network('https://api.opendota.com' + simiImg3),
                  title: Text(simiName3),
                ),
            ),
          ],
        ),
      ),
    );
  }
}