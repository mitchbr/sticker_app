import 'package:flutter/material.dart';
import 'package:sticker_map/custom_theme.dart';

import 'package:sticker_map/views/main_screen.dart';
import 'package:sticker_map/api/user.dart';
import 'package:sticker_map/views/sign_in.dart';

class StickerMap extends StatefulWidget {
  const StickerMap({Key? key}) : super(key: key);

  @override
  _StickerMapState createState() => _StickerMapState();
}

class _StickerMapState extends State<StickerMap> {
  _StickerMapState();
  final theme = CustomTheme();
  bool signedIn = false;
  Future<String> username = UsersAPI().getUsername();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: username,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return const SignIn();
        if (snapshot.hasData) {
          if (!snapshot.data) {
            return const SignIn();
          } else {
            return const MainScreenLayout();
          }
        } else if (snapshot.hasError) {
          return bodyWidget(loadingError());
        } else {
          return bodyWidget(circularIndicator(context));
        }
      },
    );
  }

  Widget bodyWidget(Widget child) {
    return Scaffold(
      appBar: AppBar(title: const Text("StickieDB")),
      body: child,
    );
  }

  Widget circularIndicator(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: theme.accentHighlightColor,
    ));
  }

  Widget loadingError() {
    return Center(
        child: Column(
      children: [
        const Text(
          "There was an error loading data, please try again",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        IconButton(
            onPressed: (() async {
              setState(() {
                username = UsersAPI().getUsername();
              });
            }),
            icon: const Icon(Icons.refresh))
      ],
    ));
  }

  void callback(BuildContext context) {
    setState(() {
      username = UsersAPI().getUsername();
    });
  }
}
