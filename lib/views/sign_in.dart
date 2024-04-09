import 'package:flutter/material.dart';
import 'package:sticker_map/api/user.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var usersApi = UsersAPI();

  Future<String>? _usersData;

  @override
  void initState() {
    _usersData = usersApi.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StickieDB")),
      body: FutureBuilder(
          future: _usersData,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Text(snapshot.data!);
                },
              );
            } else {
              return const Text('Failed to load');
            }
          }),
    );
  }
}
