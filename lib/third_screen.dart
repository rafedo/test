import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<User> users = [];
  int page = 1;
  int perPage = 10;

  Future<void> fetchUsers() async {
    final response = await http.get(
        Uri.parse('https://reqres.in/api/users?page=$page&per_page=$perPage'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> userJsonList = jsonData['data'];
      List<User> userList = [];
      for (var userJson in userJsonList) {
        userList.add(User.fromJson(userJson));
      }
      setState(() {
        users.addAll(userList);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            users.clear();
            page = 1;
          });
          fetchUsers();
        },
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            final user = users[index];
            return ListTile(
              title: Text('${user.firstName} ${user.lastName}'),
              onTap: () {
                // Memperbarui Selected User Name di SecondScreen
                Navigator.pop(context, user.firstName);
              },
            );
          },
        ),
      ),
    );
  }
}

class User {
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
