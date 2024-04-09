import 'package:flutter/material.dart';

import 'package:sticker_map/api/user.dart';
import 'package:sticker_map/api/stick.dart';
import 'package:sticker_map/models/stick.dart';
import 'package:sticker_map/custom_theme.dart';
import 'package:sticker_map/widgets/stick_tile.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class SticksList extends StatefulWidget {
  const SticksList({Key? key}) : super(key: key);

  @override
  _SticksListState createState() => _SticksListState();
}

class _SticksListState extends State<SticksList> {
  late Stream<QuerySnapshot> stickStream;
  List listData = [];

  final userData = UsersAPI();
  final theme = CustomTheme();

  String username = 'initial_username';

  @override
  void initState() {
    stickStream = FirebaseFirestore.instance.collection('sticks').limit(10).snapshots();
    setState(() {
      userData.getUsername().then((value) => username = value);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recent Stickies", style: TextStyle(color: theme.textColor)),
      ),
      body: bodyBuilder(context),
    );
  }

  Widget bodyBuilder(BuildContext context) {
    return StreamBuilder(
      stream: stickStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return errorIndicator(context);
        }

        if (snapshot.connectionState == ConnectionState.waiting || username == 'initial_username') {
          return circularIndicator(context);
        }

        listData = processData(snapshot);

        if (listData.isEmpty) {
          return emptyWidget(context);
        }

        return entriesList(context);
      },
    );
  }

  Widget emptyWidget(BuildContext context) {
    return const Center(
        child: Icon(
      Icons.book,
      size: 100,
    ));
  }

  Widget circularIndicator(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: theme.accentHighlightColor,
    ));
  }

  Widget errorIndicator(BuildContext context) {
    return const Center(child: Text("Error loading data"));
  }

  Widget entriesList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return StickTile(stick: listData[index]);
      },
    );
  }

  List<Stick> processData(snapshot) {
    return StickService().processSticks(snapshot.data!.docs.toList());
  }
}
