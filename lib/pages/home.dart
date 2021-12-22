import 'package:dota2heroes/pages/listHero.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _controller;

  void initState(){
    super.initState();
    _controller = TabController(length: 10, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: const Text(
          'DOTA 2 HEROES',
        ),
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: [
            Tab(text: 'All Roles'),
            Tab(text: 'Carry'),
            Tab(text: 'Nuker'),
            Tab(text: 'Initiator'),
            Tab(text: 'Disabler'),
            Tab(text: 'Durable'),
            Tab(text: 'Escape'),
            Tab(text: 'Support'),
            Tab(text: 'Pusher'),
            Tab(text: 'Jungler'),
          ],
        ),
      ),
      body:
      TabBarView(
        controller: _controller,
        children: [
          listHero(role: ''),
          listHero(role: 'Carry'),
          listHero(role: 'Nuker'),
          listHero(role: 'Initiator'),
          listHero(role: 'Disabler'),
          listHero(role: 'Durable'),
          listHero(role: 'Escape'),
          listHero(role: 'Support'),
          listHero(role: 'Pusher'),
          listHero(role: 'Jungler'),
        ],
      )
    );
  }
}