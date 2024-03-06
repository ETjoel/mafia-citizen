import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/firebase_auth_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<User>? user;

  @override
  void initState() {
    super.initState();

    user = signUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: FutureBuilder(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Something went wrong... has Error');
            } else if (!snapshot.hasData) {
              return const Text("snapshot doesn't have data");
            } else {
              final User user = snapshot.data!;
              return Text('Hello  ${user.uid}');
            }
          },
        ));
  }

  Future<User>? signUser() async {
    return await Auth().signInAuth();
  }
}
