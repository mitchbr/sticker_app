import 'package:flutter/material.dart';

import 'package:sticker_map/api/user.dart';
import 'package:sticker_map/custom_theme.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

class StickersList extends StatefulWidget {
  const StickersList({Key? key}) : super(key: key);

  @override
  _StickersListState createState() => _StickersListState();
}

class _StickersListState extends State<StickersList> {
  final userData = UsersAPI();
  final theme = CustomTheme();

  String username = 'initial_username';

  @override
  void initState() {
    setState(() {
      userData.getUsername().then((value) => username = value);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stickie Map", style: TextStyle(color: theme.textColor)),
      ),
      body: bodyBuilder(context),
    );
  }

  Widget bodyBuilder(BuildContext context) {
    return Text("In Progress", style: TextStyle(color: theme.textColor));
  }
}
