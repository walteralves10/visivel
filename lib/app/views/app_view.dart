import 'package:flutter/material.dart';
import 'package:visivel/app/views/asset_player_view.dart';
import 'package:visivel/app/views/asset_video_in_list_view.dart';
import 'package:visivel/app/views/network_player_view.dart';
import 'package:visivel/app/views/player_video_and_pop_page_view.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: const ValueKey<String>('home_page'),
        appBar: AppBar(
          title: const Text('Video player example'),
          actions: <Widget>[
            IconButton(
              key: const ValueKey<String>('push_tab'),
              icon: const Icon(Icons.navigation),
              onPressed: () {
                Navigator.push<PlayerVideoAndPopPageView>(
                  context,
                  MaterialPageRoute<PlayerVideoAndPopPageView>(
                    builder: (BuildContext context) =>
                        PlayerVideoAndPopPageView(),
                  ),
                );
              },
            )
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud),
                text: 'Network',
              ),
              Tab(icon: Icon(Icons.insert_drive_file), text: 'Asset'),
              Tab(icon: Icon(Icons.list), text: 'List example'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            NetworkPlayerView(),
            AssetPlayerView(),
            AssetVideoInListView(),
          ],
        ),
      ),
    );
  }
}
