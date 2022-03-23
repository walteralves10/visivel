import 'package:flutter/material.dart';
import 'package:visivel/app/components/example_card.dart';
import 'package:visivel/app/views/asset_player_view.dart';

class AssetVideoInListView extends StatelessWidget {
  const AssetVideoInListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const ExampleCard(title: 'Item a'),
        const ExampleCard(title: 'Item b'),
        const ExampleCard(title: 'Item c'),
        const ExampleCard(title: 'Item d'),
        const ExampleCard(title: 'Item e'),
        const ExampleCard(title: 'Item f'),
        const ExampleCard(title: 'Item g'),
        Card(
            child: Column(children: <Widget>[
          Column(
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.cake),
                title: Text('Video video'),
              ),
              Stack(
                  alignment: FractionalOffset.bottomRight +
                      const FractionalOffset(-0.1, -0.1),
                  children: <Widget>[
                    AssetPlayerView(),
                    Image.asset('assets/flutter-mark-square-64.png'),
                  ]),
            ],
          ),
        ])),
        const ExampleCard(title: 'Item h'),
        const ExampleCard(title: 'Item i'),
        const ExampleCard(title: 'Item j'),
        const ExampleCard(title: 'Item k'),
        const ExampleCard(title: 'Item l'),
      ],
    );
  }
}
