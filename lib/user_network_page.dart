
import 'package:flutter/material.dart';
import 'Users_Api.dart';
import 'User.dart';


class UserNetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: FutureBuilder<List<User>>(
      future: UsersApi.getUsers(),
      builder: (context, snapshot) {
        final users = snapshot.data;
        print(users);

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
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

  Widget buildUsers(List<User> users) => ListView.builder(

    itemCount: users.length,
    itemBuilder: (context, index) {
      final user = users[index];

      return ListTile(

      title: Text('$user.id'),

      );
    },
  );
}



