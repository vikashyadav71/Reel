

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lode/yello.dart';
import 'package:video_player/video_player.dart';


import 'Users_Api.dart';

import 'User.dart';


class UserLocalPage extends StatefulWidget {
  @override
  State<UserLocalPage> createState() => _UserLocalPageState();
}

class _UserLocalPageState extends State<UserLocalPage> {
 late VideoPlayerController _controller; late  String url;
 void initState() {UsersApi.getUsersLocally(context);
   super.initState();

 }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: FutureBuilder<List<User>>(
          future: UsersApi.getUsersLocally(context),
          builder: (context, snapshot) {
            final users = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return const Center(child: Text('Some error occurred!'));
                } else {
                  return buildUsers(users!);
                }
            }
          },
        ),
      );

  Widget buildUsers(List<User> users) =>
      ListView.builder(
itemCount: users.length,
          itemBuilder: (context, index)  {

            return Column(children: [
              Row(children: [Text(users[index].title,style: TextStyle(fontSize:29,color: Colors.red),)]),
              VideoApp(users[index].videoUrl,users[index].id)],
            );

          });
}